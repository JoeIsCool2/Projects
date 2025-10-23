let multipleChoiceQuestions: [MultipleChoice] = [
    MultipleChoice(
        question: "Which fruit do you like best? (Choose as many as you want)",
        answers: [
            "Strawberry" : .Hufflepuff,
            "Pomegranate" : .Ravenclaw,
            "Banana" : .Slytherin,
            "Dragonfruit" : .Gryffindor
        ]
    ),
    MultipleChoice(
        question: "Which type of music do you vibe with most? (Choose as many as you want)",
        answers: [
            "Rock anthems" : .Slytherin,
            "Electronic beats" : .Hufflepuff,
            "Acoustic folk" : .Ravenclaw,
            "Classical or jazz" : .Gryffindor
        ]
    ),
    MultipleChoice(
        question: "Pick a color you’re drawn to. (Choose as many as you want)",
        answers: [
            "Red" : .Ravenclaw,
            "Green" : .Hufflepuff,
            "Yellow" : .Gryffindor,
            "Blue" : .Slytherin
        ]
    ),
    MultipleChoice(
        question: "Which pet would you adopt? (Choose as many as you want)",
        answers: [
            "Dog" : .Slytherin,
            "Cat" : .Ravenclaw,
            "Rabbit" : .Gryffindor,
            "Owl" : .Hufflepuff
        ]
    )
]


let pickerQuestions: [PickerQuestionMaker] = [
    PickerQuestionMaker(
        question: "What’s your favorite drink?",
        answers: [
            "Spicy ginger ale" : .Ravenclaw,
            "Espresso" : .Hufflepuff,
            "Hot cocoa" : .Slytherin,
            "Green tea" : .Gryffindor
        ]
    ),
    PickerQuestionMaker(
        question: "Which place would you rather explore?",
        answers: [
            "Mountain trail" : .Slytherin,
            "Abandoned building" : .Hufflepuff,
            "Cozy café" : .Gryffindor,
            "Quiet library" : .Ravenclaw
        ]
    ),
    PickerQuestionMaker(
        question: "Which snack calls to you?",
        answers: [
            "Chips" : .Ravenclaw,
            "Chocolate" : .Gryffindor,
            "Cookies" : .Slytherin,
            "Tea biscuits" : .Hufflepuff
        ]
    ),
    PickerQuestionMaker(
        question: "What’s your favorite season?",
        answers: [
            "Summer" : .Hufflepuff,
            "Winter" : .Ravenclaw,
            "Spring" : .Slytherin,
            "Autumn" : .Gryffindor
        ]
    )
]


let sliderQuestions: [SliderQuestionMaker] = [
    SliderQuestionMaker(
        question: "How much do you enjoy surprises?",
        answers: [
            0...25 : .Slytherin,
            26...50 : .Ravenclaw,
            51...75 : .Hufflepuff,
            76...100 : .Gryffindor
        ],
        lowLabel: "Hate them",
        highLabel: "Love them",
        amount: 0
    ),
    SliderQuestionMaker(
        question: "How competitive are you?",
        answers: [
            0...25 : .Ravenclaw,
            26...50 : .Gryffindor,
            51...75 : .Slytherin,
            76...100 : .Hufflepuff
        ],
        lowLabel: "Not at all",
        highLabel: "Extremely",
        amount: 0
    ),
    SliderQuestionMaker(
        question: "How much do you like being the center of attention?",
        answers: [
            0...25 : .Hufflepuff,
            26...50 : .Slytherin,
            51...75 : .Ravenclaw,
            76...100 : .Gryffindor
        ],
        lowLabel: "Prefer background",
        highLabel: "Love spotlight",
        amount: 0
    ),
    SliderQuestionMaker(
        question: "How much do you trust strangers?",
        answers: [
            0...25 : .Gryffindor,
            26...50 : .Hufflepuff,
            51...75 : .Ravenclaw,
            76...100 : .Slytherin
        ],
        lowLabel: "Not at all",
        highLabel: "Completely",
        amount: 0
    )
]




