struct CalendarData {
    let days = [
        Today(
            lessonID: "TP01",
            lessonName: "Introduction to Swift",
            mainObjective: "Get familiar with Xcode, Swift playgrounds, and basic syntax.",
            readingDue: "Read Swift Fundamentals 1.1",
            assignmentsDue: "Setup development environment",
            newAssignments: "Hello, Swift!",
            dailyCodeChallengeName: "SF01 - 'Hello Console' - print and comments",
            wordOfTheDay: "Syntax"
        ),
        Today(
            lessonID: "TP02",
            lessonName: "Constants and Variables",
            mainObjective: "Understand let vs var and basic types.",
            readingDue: "Read Swift Fundamentals 1.2",
            assignmentsDue: "Short exercises on let/var",
            newAssignments: "Type Basics",
            dailyCodeChallengeName: "SF02 - 'Swap Shop' - variables and constants",
            wordOfTheDay: "Variable"
        ),
        Today(
            lessonID: "TP03",
            lessonName: "Operators and Control Flow",
            mainObjective: "Use arithmetic, comparison, and logical operators with if/else.",
            readingDue: "Read Swift Fundamentals 1.3",
            assignmentsDue: "Operator drills",
            newAssignments: "Control Flow Basics",
            dailyCodeChallengeName: "SF03 - 'Colors, Numbers, Letters' - If/Switch",
            wordOfTheDay: "Operator"
        ),
        Today(
            lessonID: "TP04",
            lessonName: "Strings and Interpolation",
            mainObjective: "Manipulate strings and use interpolation effectively.",
            readingDue: "Read Swift Fundamentals 1.4",
            assignmentsDue: "String manipulation tasks",
            newAssignments: "String Practice",
            dailyCodeChallengeName: "SF04 - 'Word Play' - Strings",
            wordOfTheDay: "Interpolation"
        ),
        Today(
            lessonID: "TP05",
            lessonName: "Collections: Arrays",
            mainObjective: "Create and modify arrays, understand mutability.",
            readingDue: "Read Swift Fundamentals 1.5",
            assignmentsDue: "Array warmups",
            newAssignments: "Array Basics",
            dailyCodeChallengeName: "SF05 - 'List It' - Arrays",
            wordOfTheDay: "Array"
        ),
        Today(
            lessonID: "TP06",
            lessonName: "Collections: Dictionaries",
            mainObjective: "Store and retrieve key-value data.",
            readingDue: "Read Swift Fundamentals 1.6",
            assignmentsDue: "Dictionary exercises",
            newAssignments: "Key/Value Practice",
            dailyCodeChallengeName: "SF06 - 'Lookup' - Dictionaries",
            wordOfTheDay: "Dictionary"
        ),
        Today(
            lessonID: "TP07",
            lessonName: "Loops and Iteration",
            mainObjective: "Use for-in and while loops effectively.",
            readingDue: "Read Swift Fundamentals 1.7",
            assignmentsDue: "Looping exercises",
            newAssignments: "Iteration Challenges",
            dailyCodeChallengeName: "SF07 - 'Loop the Loop' - For/While",
            wordOfTheDay: "Iteration"
        ),
        Today(
            lessonID: "TP08",
            lessonName: "Functions Basics",
            mainObjective: "Define and call functions with parameters and returns.",
            readingDue: "Read Swift Fundamentals 2.1",
            assignmentsDue: "Function practice problems",
            newAssignments: "Function Composition",
            dailyCodeChallengeName: "SF08 - 'Can You Digit' - Parameters",
            wordOfTheDay: "Function"
        ),
        Today(
            lessonID: "TP09",
            lessonName: "Functions: Labels and Defaults",
            mainObjective: "Use argument labels and default parameter values.",
            readingDue: "Read Swift Fundamentals 2.2",
            assignmentsDue: "Labeling exercises",
            newAssignments: "Default Parameters",
            dailyCodeChallengeName: "SF09 - 'Name It' - Labels",
            wordOfTheDay: "Parameter"
        ),
        Today(
            lessonID: "TP10",
            lessonName: "Optionals 101",
            mainObjective: "Learn what optionals are and why they matter.",
            readingDue: "Read Swift Fundamentals 2.3",
            assignmentsDue: "Optional intros",
            newAssignments: "Nil and Unwrapping",
            dailyCodeChallengeName: "SF10 - 'Maybe Maybe Not' - Optionals",
            wordOfTheDay: "Optional"
        ),
        Today(
            lessonID: "TP11",
            lessonName: "Optional Unwrapping",
            mainObjective: "Use if let, guard let, and nil coalescing.",
            readingDue: "Read Swift Fundamentals 2.3 (cont.)",
            assignmentsDue: "Unwrapping worksheet",
            newAssignments: "Safe Unwrapping",
            dailyCodeChallengeName: "SF11 - 'Guard Duty' - guard let",
            wordOfTheDay: "Unwrap"
        ),
        Today(
            lessonID: "TP12",
            lessonName: "Structs and Data Modeling",
            mainObjective: "Create custom structs and initializers.",
            readingDue: "Read Swift Fundamentals 2.4",
            assignmentsDue: "Struct design challenge",
            newAssignments: "Modeling with Structs",
            dailyCodeChallengeName: "SF12 - 'Build-a-Struct' - Structs",
            wordOfTheDay: "Struct"
        ),
        Today(
            lessonID: "TP13",
            lessonName: "Value vs Reference",
            mainObjective: "Understand copy semantics and immutability.",
            readingDue: "Read Swift Fundamentals 2.5",
            assignmentsDue: "Copy semantics notes",
            newAssignments: "Value Types",
            dailyCodeChallengeName: "SF13 - 'Copy That' - Values",
            wordOfTheDay: "Value"
        ),
        Today(
            lessonID: "TP14",
            lessonName: "Enumerations",
            mainObjective: "Define enums with associated values and raw values.",
            readingDue: "Read Swift Fundamentals 2.6",
            assignmentsDue: "Enum practice",
            newAssignments: "Associated Values",
            dailyCodeChallengeName: "SF14 - 'State of Mind' - Enums",
            wordOfTheDay: "Enum"
        ),
        Today(
            lessonID: "TP15",
            lessonName: "Pattern Matching and Switch",
            mainObjective: "Use switch with patterns and where clauses.",
            readingDue: "Read Swift Fundamentals 2.7",
            assignmentsDue: "Switch statements",
            newAssignments: "Pattern Matching",
            dailyCodeChallengeName: "SF15 - 'Case Closed' - Switch",
            wordOfTheDay: "Pattern"
        ),
        Today(
            lessonID: "TP16",
            lessonName: "Closures Basics",
            mainObjective: "Use closures as inline functions and callbacks.",
            readingDue: "Read Swift Fundamentals 3.1",
            assignmentsDue: "Closure warmups",
            newAssignments: "Closure Syntax",
            dailyCodeChallengeName: "SF16 - 'Close Call' - Closures",
            wordOfTheDay: "Closure"
        ),
        Today(
            lessonID: "TP17",
            lessonName: "Higher-Order Functions",
            mainObjective: "Use map, filter, and reduce with collections.",
            readingDue: "Read Swift Fundamentals 3.2",
            assignmentsDue: "HOF exercises",
            newAssignments: "Functional Patterns",
            dailyCodeChallengeName: "SF17 - 'MapQuest' - map/filter/reduce",
            wordOfTheDay: "Map"
        ),
        Today(
            lessonID: "TP18",
            lessonName: "Error Handling",
            mainObjective: "Throw, try, and catch errors in Swift.",
            readingDue: "Read Swift Fundamentals 3.3",
            assignmentsDue: "Error handling drills",
            newAssignments: "Do/Try/Catch",
            dailyCodeChallengeName: "SF18 - 'Try Me' - Errors",
            wordOfTheDay: "Error"
        ),
        Today(
            lessonID: "TP19",
            lessonName: "Protocols",
            mainObjective: "Define protocols and adopt them in types.",
            readingDue: "Read Swift Fundamentals 3.4",
            assignmentsDue: "Protocol adoption",
            newAssignments: "Protocol Oriented",
            dailyCodeChallengeName: "SF19 - 'Contract' - Protocols",
            wordOfTheDay: "Protocol"
        ),
        Today(
            lessonID: "TP20",
            lessonName: "Generics Basics",
            mainObjective: "Create generic functions and types.",
            readingDue: "Read Swift Fundamentals 3.5",
            assignmentsDue: "Generics warmups",
            newAssignments: "Generic Functions",
            dailyCodeChallengeName: "SF20 - 'Any Type' - Generics",
            wordOfTheDay: "Generic"
        ),
        Today(
            lessonID: "TP21",
            lessonName: "Extensions",
            mainObjective: "Extend existing types with new functionality.",
            readingDue: "Read Swift Fundamentals 3.6",
            assignmentsDue: "Extension tasks",
            newAssignments: "Type Extensions",
            dailyCodeChallengeName: "SF21 - 'Plus One' - Extensions",
            wordOfTheDay: "Extension"
        ),
        Today(
            lessonID: "TP22",
            lessonName: "Memory and ARC",
            mainObjective: "Understand reference cycles and memory management.",
            readingDue: "Read Swift Fundamentals 3.7",
            assignmentsDue: "ARC notes",
            newAssignments: "Weak/Unowned",
            dailyCodeChallengeName: "SF22 - 'No Cycles' - ARC",
            wordOfTheDay: "Memory"
        ),
        Today(
            lessonID: "TP23",
            lessonName: "Access Control",
            mainObjective: "Use public/internal/fileprivate/private effectively.",
            readingDue: "Read Swift Fundamentals 3.8",
            assignmentsDue: "Access modifiers",
            newAssignments: "Encapsulation",
            dailyCodeChallengeName: "SF23 - 'Keep Out' - Access",
            wordOfTheDay: "Access"
        ),
        Today(
            lessonID: "TP24",
            lessonName: "Testing Basics",
            mainObjective: "Write simple unit tests and assertions.",
            readingDue: "Read Swift Fundamentals 3.9",
            assignmentsDue: "Testing setup",
            newAssignments: "Assertions",
            dailyCodeChallengeName: "SF24 - 'Prove It' - Tests",
            wordOfTheDay: "Test"
        ),
        Today(
            lessonID: "TP25",
            lessonName: "Operators and Control Flow",
            mainObjective: "Build Swift functions that take multiple named arguments, include default values, and return or don't return an object.",
            readingDue: "Read Swift Fundamentals 1.4, 1.5",
            assignmentsDue: "Some good stuff",
            newAssignments: "Constants and Variables",
            dailyCodeChallengeName: "SF03 - 'Colors, Numbers, Letters' - Control Flow, If Statements, Switch Statements",
            wordOfTheDay: "Console"
        ),
        Today(
            lessonID: "TP26",
            lessonName: "Functions and Parameters",
            mainObjective: "Understand how to define and call functions with parameters and return values.",
            readingDue: "Read Swift Fundamentals 2.1",
            assignmentsDue: "Function practice problems",
            newAssignments: "Function Composition",
            dailyCodeChallengeName: "SF04 - 'Can You Digit' - Regular Expressions and Input Validation",
            wordOfTheDay: "Parameter"
        ),
        Today(
            lessonID: "TP27",
            lessonName: "Collections and Loops",
            mainObjective: "Work with arrays and dictionaries, and iterate using for-in loops.",
            readingDue: "Read Swift Fundamentals 2.2",
            assignmentsDue: "Looping exercises",
            newAssignments: "Array Manipulation",
            dailyCodeChallengeName: "SF05 - 'Loop the Loop' - For-in and While Loops",
            wordOfTheDay: "Iteration"
        ),
        Today(
            lessonID: "TP28",
            lessonName: "Optionals and Safety",
            mainObjective: "Learn how to use optionals and safely unwrap values.",
            readingDue: "Read Swift Fundamentals 2.3",
            assignmentsDue: "Optional handling worksheet",
            newAssignments: "Safe Unwrapping",
            dailyCodeChallengeName: "SF06 - 'Maybe Maybe Not' - Optionals and Nil Coalescing",
            wordOfTheDay: "Optional"
        ),
        Today(
            lessonID: "TP29",
            lessonName: "Structs and Data Modeling",
            mainObjective: "Create and use custom structs to model data.",
            readingDue: "Read Swift Fundamentals 2.4",
            assignmentsDue: "Struct design challenge",
            newAssignments: "Modeling with Structs",
            dailyCodeChallengeName: "SF07 - 'Build-a-Struct' - Structs and Initializers",
            wordOfTheDay: "Struct"
        ),
        Today(
            lessonID: "TP30",
            lessonName: "Swift Concurrency Intro",
            mainObjective: "Understand async/await and tasks at a high level.",
            readingDue: "Read Swift Concurrency Overview",
            assignmentsDue: "Async/await reading notes",
            newAssignments: "Async Functions",
            dailyCodeChallengeName: "SF30 - 'Await a Minute' - async/await",
            wordOfTheDay: "Concurrency"
        ),
        Today(
            lessonID: "TP31",
            lessonName: "Project Day and Review",
            mainObjective: "Review all topics and build a small project.",
            readingDue: "Review your notes",
            assignmentsDue: "Mini project",
            newAssignments: "Final Polishing",
            dailyCodeChallengeName: "SF31 - 'Wrap Up' - Review",
            wordOfTheDay: "Review"
        )
    ]

}
