# PlantPlate

PlantPlate is an app designed to help vegan users craft interesting and creative meals based on the ingredients they have at home.

## Background

Many individuals embarking on a vegan journey nationwide encounter challenges in sustaining their newfound lifestyle, with an estimated 84% abandoning it within the initial year.

PlantPlate addresses this struggle by offering a primary function—to deliver wholesome and inventive meals conveniently to users. Featuring a straightforward and user-friendly interface, PlantPlate empowers users to effortlessly generate meals tailored to their specific needs, courtesy of the assistance provided by the ChatGPT AI. Our overarching objective is to support new and existing vegans in maintaining a consistent diet and embracing a sustainable lifestyle.


## Features

- Dark Mode
- voiceOver Accessibility
- High Contrast Accessibility
- Button Shapes Accessibility
- Text Size Accessibility (coming soon)


## Color Reference
The color scheme used for PlantPlate. We selected these colors to evoke a sense of freshness, health, and sustainability, creating a visually appealing and calming experience for our users.
| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Primary Color | ![#F4E2CB](https://via.placeholder.com/10/F4E2CB?text=+) #F4E2CB |
| Secondary Color | ![#074B3F](https://via.placeholder.com/10/074B3F?text=+) #074B3F |
| Button Color | ![#653280](https://via.placeholder.com/10/653280?text=+) #653280 |


## API Reference
By leveraging the ChatGPT API, we successfully collected users' preferences and curated a vegan recipe tailored to their individual tastes.

```http
  POST /v1/chat/completions
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `messages` | `array` | **Required**. Array of message objects for conversation history |

Refer to the [OpenAI API documentation](https://platform.openai.com/docs/introduction) for information on rate limits and guidelines. 

For support, contact OpenAI at support@openai.com


## Lessons Learned

What did you learn while building this project? What challenges did you face and how did you overcome them?

PlantPlate offered us the opportunity to hone our skills in MVVM architecture. Through dedicated practice and hands-on development, we've cultivated a better understanding of structuring code following the MVVM pattern. This methodology emphasizes the importance of maintaining clear boundaries between the View, Models/Data, and ViewModels, fostering a cohesive and maintainable codebase.

![toolbar](https://github.com/JonesHenrik/PlantPlate/blob/main/toolbar.png)

This project allowed us to delve into the effective use of @State variables within the SwiftUI framework. Elevating our proficiency in leveraging @State for dynamic UI updates and state management.

One notable application of @State in our project was its pivotal role in handling user input. By incorporating @State variables strategically, we enabled users to actively participate in shaping their experience. This not only facilitated dynamic alterations to the user interface but also allowed users to influence the prompt, tailoring it to their specific needs and preferences.

![@State](https://github.com/JonesHenrik/PlantPlate/blob/main/%40StateEditor.png)


## Acknowledgements

I would like to thank my team (names below) for all of the hard work everyone provided. It was a collaborative effort for this challenge to be completed, and the ideas were not mine alone.


## Authors

- Henrik Jones - Developer
- Ariel Rue - Developer
- Raven Shelman - Designer
- Natalie Pryor - Designer
- Coach - Project Manager


## Swift Documentation

[Documentation](https://developer.apple.com/documentation/swift)


## Screenshots

![First](https://github.com/JonesHenrik/PlantPlate/blob/main/IMG_1764.PNG)

![Second](https://github.com/JonesHenrik/PlantPlate/blob/main/IMG_1765.PNG)

![Third](https://github.com/JonesHenrik/PlantPlate/blob/main/IMG_1766.PNG)

![Fourth](https://github.com/JonesHenrik/PlantPlate/blob/main/IMG_1767.PNG)
