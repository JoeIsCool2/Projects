let multipleChoiceQuestions: [MultipleChoice] = [
    MultipleChoice(
        question: "Which fruit are you most likely to pick as a favorite? (Choose as many as you want)",
        answers: [
            "Banana" : .Slytherin,
            "Dragonfruit" : .Gryffindor,
            "Strawberry" : .Hufflepuff,
            "Pomegranate" : .Ravenclaw
        ]
    ),
    MultipleChoice(
        question: "Which music style do you enjoy most? (Choose as many as you want)",
        answers: [
            "Ambient/electronic" : .Ravenclaw,
            "Dark trap or hard rap" : .Slytherin,
            "Anthemic rock" : .Gryffindor,
            "Upbeat pop/dance" : .Hufflepuff
        ]
    ),
    MultipleChoice(
        question: "Pick the color you’re most drawn to. (Choose as many as you want)",
        answers: [
            "Blue" : .Ravenclaw,
            "Yellow" : .Hufflepuff,
            "Green" : .Slytherin,
            "Red" : .Gryffindor
        ]
    ),
    MultipleChoice(
        question: "Which pet would you most like to adopt? (Choose as many as you want)",
        answers: [
            "Clever snake" : .Slytherin,
            "Insightful cat" : .Ravenclaw,
            "Lionhearted dog" : .Gryffindor,
            "Faithful rabbit" : .Hufflepuff
        ]
    )
]


let pickerQuestions: [PickerQuestionModel] = [
    PickerQuestionModel(
        prompt: "What’s your go-to drink?",
        answers: [
            "Spicy ginger ale" : .Gryffindor,
            "Espresso" : .Slytherin,
            "Hot cocoa" : .Hufflepuff,
            "Green tea" : .Ravenclaw
        ]
    ),
    PickerQuestionModel(
        prompt: "Which place would you rather spend an afternoon exploring?",
        answers: [
            "Shadowy city alleys" : .Slytherin,
            "Cozy café with friends" : .Hufflepuff,
            "Mountain climb" : .Gryffindor,
            "Quiet library" : .Ravenclaw
        ]
    ),
    PickerQuestionModel(
        prompt: "Which snack are you craving right now?",
        answers: [
            "Rich truffles" : .Slytherin,
            "Bold dark chocolate" : .Gryffindor,
            "Warm cookies to share" : .Hufflepuff,
            "Savory chips while reading" : .Ravenclaw
        ]
    ),
    PickerQuestionModel(
        prompt: "Which season do you enjoy the most?",
        answers: [
            "Spring (fresh starts and ambition)" : .Slytherin,
            "Winter (quiet and reflective)" : .Ravenclaw,
            "Autumn (crisp and adventurous)" : .Gryffindor,
            "Summer (warm and friendly)" : .Hufflepuff
        ]
    )
]


let sliderQuestions: [SliderQuestionMaker] = [
    SliderQuestionMaker(
        question: "How much do you enjoy surprises?",
        answers: [
            0...25 : .Ravenclaw,
            26...50 : .Hufflepuff,
            51...75 : .Slytherin,
            76...100 : .Gryffindor
        ],
        lowLabel: "Hate them",
        highLabel: "Love them",
        defaultAmount: 0
    ),
    SliderQuestionMaker(
        question: "How competitive do you consider yourself?",
        answers: [
            0...25 : .Hufflepuff,
            26...50 : .Ravenclaw,
            51...75 : .Gryffindor,
            76...100 : .Slytherin
        ],
        lowLabel: "Not at all",
        highLabel: "Extremely",
        defaultAmount: 0
    ),
    SliderQuestionMaker(
        question: "How comfortable are you being the center of attention?",
        answers: [
            0...25 : .Ravenclaw,
            26...50 : .Hufflepuff,
            51...75 : .Slytherin,
            76...100 : .Gryffindor
        ],
        lowLabel: "Prefer background",
        highLabel: "Love spotlight",
        defaultAmount: 0
    ),
    SliderQuestionMaker(
        question: "How much do you tend to trust strangers?",
        answers: [
            0...25 : .Slytherin,
            26...50 : .Ravenclaw,
            51...75 : .Hufflepuff,
            76...100 : .Gryffindor
        ],
        lowLabel: "Not at all",
        highLabel: "Completely",
        defaultAmount: 0
    )
]





