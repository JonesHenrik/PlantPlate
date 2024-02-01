//
//  PreferenceModel.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import Foundation

enum Time: String, CaseIterable, Identifiable {
    case supriseMe, tenMin, twentyMin, thirtyMin
    var id: Self { self }
}
func timeSelection(_ time: Time) -> String {
    switch time {
    case .supriseMe:
        return "time is not an issue. "
    case .tenMin:
        return "to cook for ten minutes. "
    case .twentyMin:
        return "to cook for twenty minutes. "
    case .thirtyMin:
        return "to cook for thirty minutes. "
    }
}

enum DishStyle: String, CaseIterable, Identifiable {
    case breakfast, lunch, dinner, snack
    var id: Self { self }
}
func dishStyleSelection(_ dishStyle: DishStyle) -> String {
    switch dishStyle {
    case .breakfast:
        return "I want it to be a breakfast. "
    case .lunch:
        return "I want it to be a lunch. "
    case .dinner:
        return "I want it to be a dinner. "
    case .snack:
        return "I want a snack. "
    }
}

// Is located on the filter page
enum DietType: String, CaseIterable, Identifiable {
    case none, wholeFood, rawFood, eightyTenTen, keto, alkaline, junkFood, veganForWeightLoss
    var id: Self { self }
}
func diet(_ dietType: DietType) -> String {
    switch dietType {
    case .none:
        return "I do not follow a specific type of vegan diet. Please just make sure it is vegan. "
    case .wholeFood:
        return "I would like this meal to fall within the whole food vegan diet. "
    case .rawFood:
        return "I would like this meal to fall within the raw food vegan diet. "
    case .eightyTenTen:
        return "I would like this meal to fall within the 80/10/10 vegan diet. "
    case .keto:
        return "I would like this meal to fall within the keto vegan diet. "
    case .alkaline:
        return "I would like this meal to fall within the alkaline vegan diet. "
    case .junkFood:
        return "I would like this meal to fall within the junk food vegan diet. "
    case .veganForWeightLoss:
        return "I would like this meal to fall within the weight loss vegan diet. "
    }
}



func allergens(_ food: String) -> String {
    if food == "" {
       return "I have no allergies. "
    } else {
       return "I am allergic to the following: " + food
    }
}

func glutenFree(_ noBread: Bool) -> String {
    if noBread {
        return "I am gluten free. Please do not include any items that may contain gluten. "
    } else {
        return "I am not gluten free. "
    }
}

func serving(_ servingSize: Int) -> String {
    "I am serving \(servingSize) amount of people. "
}
