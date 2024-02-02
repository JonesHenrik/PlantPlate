//
//  ChatViewModel.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import Foundation
import SwiftUI

var ingredient = ""
var masterPrompt = "Hello, I would like you pretend to be a world class chef. please create me a vegan dish, that I will be able to prepare myself at home. I would like to be addressed with Yes, Chef when you create my meal. Please make the dish with only using the ingredients I list. You must stick to the ingredients that I list for the dish. If anything that is not an ingredient happens to be listed. Please respond with 'Make sure to list ingriedents, Try again.'. Please also instruct me to 'Close out of the sheet and enter ingredients'. If no ingrediants are listed instruct me to 'Close out of the sheet and enter ingredients'. Feel free to make a joke about whatever I incorrectly put. I will now list out my ingreidiants, type of meal, time I would like to cook it in, whether or not I have allergies, if I am gluten free, if I follow a specific type of vegan diet, and the amount of people I am serving: "

class ChatViewModel: ObservableObject {
    @Published var generatedText: String = ""
    
    func sendChatGPTRequest(prompt: String, apiKey: String) {
        
        let urlString = "https://api.openai.com/v1/chat/completions"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                //how you want it to talk
                ["role": "system", "content": "You are a vegan chef. That is environmentally conscious. "],
                ["role": "user", "content": prompt]
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error encoding request parameters: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                if let jsonResponse = json as? [String: Any],
                                   let choices = jsonResponse["choices"] as? [[String: Any]],
                                   let text = choices.first?["message"] as? [String: String],
                                   let content = text["content"] {
                                    DispatchQueue.main.async {
                                        self.generatedText = content
                                    }
                                } else {
                                    print("not serializing")
                                }
                
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
