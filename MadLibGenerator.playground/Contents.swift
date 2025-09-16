import UIKit


func generateMadLib(noun1: String, adjective1: String, verb1: String, noun2: String, adjective2: String, verb2: String, noun3: String, adjective3: String, verb3: String, noun4: String, adjective4: String, verb4: String) -> String {
    
    
    
    var nouns = [noun1, noun2, noun3, noun4]
    if nouns.contains("") || nouns.contains(" ") {
        return "Invalid Input"
    } else {
        nouns.shuffle()
    }
        
    var adjectives = [adjective1, adjective2, adjective3, adjective4]
    if adjectives.contains("") || adjectives.contains(" ") {
        return "Invalid Input"
    } else {
        adjectives.shuffle()
    }
            
    var verbs = [verb1, verb2, verb3, verb4]
    if verbs.contains("") || verbs.contains(" ") {
        return "Invalid Input"
    } else {
        verbs.shuffle()
    }
    
    let stories: [String] = [
        "Today, a \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) into a \(adjectives[1]) \(nouns[1]). Everyone was shocked when a \(adjectives[2]) \(nouns[2]) showed up and started to \(verbs[1]) loudly. In the chaos, the \(nouns[3]) just kept trying to \(verbs[2]) like nothing was wrong.",

        "At the park, the \(adjectives[0]) \(nouns[0]) thought it was a good idea to \(verbs[0]) on top of the \(adjectives[1]) \(nouns[1]). But then, a \(adjectives[2]) \(nouns[2]) appeared and began to \(verbs[1]) furiously. To make it even weirder, the \(adjectives[3]) \(nouns[3]) decided to join in and \(verbs[2]) too.",

        "Once upon a time, a \(adjectives[0]) \(nouns[0]) was bored and wanted to \(verbs[0]). It asked its best friend, the \(adjectives[1]) \(nouns[1]), to join. Just when things seemed normal, a \(adjectives[2]) \(nouns[2]) ran in and started to \(verbs[1]). The story ended with everyone watching the \(adjectives[3]) \(nouns[3]) trying to \(verbs[2]) in the background.",

        "During lunch, a \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) while eating a sandwich. Suddenly, a \(adjectives[1]) \(nouns[1]) crashed the table and began to \(verbs[1]). A crowd formed when a \(adjectives[2]) \(nouns[2]) rolled in to \(verbs[2]). Nobody noticed the \(adjectives[3]) \(nouns[3]) quietly sneaking away.",

        "In the lab, a \(adjectives[0]) \(nouns[0]) was trying to \(verbs[0]) with a mysterious potion. Just as it added the final ingredient, a \(adjectives[1]) \(nouns[1]) burst through the door and began to \(verbs[1]) uncontrollably. The chaos escalated when a \(adjectives[2]) \(nouns[2]) flew in and started to \(verbs[2]) all over the equipment. Meanwhile, the \(adjectives[3]) \(nouns[3]) took notes like it was all perfectly normal.",

        "In a strange twist of events, a \(adjectives[0]) \(nouns[0]) decided to \(verbs[0]) across town. Along the way, it bumped into a \(adjectives[1]) \(nouns[1]) that started to \(verbs[1]) without warning. Things only got funnier when a \(adjectives[2]) \(nouns[2]) jumped in to \(verbs[2]), leaving the poor \(adjectives[3]) \(nouns[3]) wondering what just happened.",

        "On vacation, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) at the beach. Out of nowhere, a \(adjectives[1]) \(nouns[1]) began to \(verbs[1]) near the water. Tourists gasped when the \(adjectives[2]) \(nouns[2]) joined in and tried to \(verbs[2]) as well. Meanwhile, the \(adjectives[3]) \(nouns[3]) just sat quietly and watched.",

        "Late at night, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) through the streets. But then, a \(adjectives[1]) \(nouns[1]) blocked the path and began to \(verbs[1]). Things escalated when a \(adjectives[2]) \(nouns[2]) joined in and tried to \(verbs[2]). The whole event ended when the \(adjectives[3]) \(nouns[3]) disappeared mysteriously.",

        "In the forest, the \(adjectives[0]) \(nouns[0]) was searching for food when it decided to \(verbs[0]). Suddenly, a \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]). The noise scared a \(adjectives[2]) \(nouns[2]) that started to \(verbs[2]) uncontrollably. In the end, the \(adjectives[3]) \(nouns[3]) had to calm everyone down.",

        "At school, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) during class. The teacher, a \(adjectives[1]) \(nouns[1]), wasn’t happy and began to \(verbs[1]). To everyone’s surprise, the \(adjectives[2]) \(nouns[2]) joined in and tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) simply pretended not to notice.",

        "During the concert, the \(adjectives[0]) \(nouns[0]) grabbed a microphone and started to \(verbs[0]). The crowd roared until a \(adjectives[1]) \(nouns[1]) interrupted by trying to \(verbs[1]). Chaos broke out when the \(adjectives[2]) \(nouns[2]) ran on stage to \(verbs[2]). The poor \(adjectives[3]) \(nouns[3]) fainted in disbelief.",

        "On the spaceship, the \(adjectives[0]) \(nouns[0]) attempted to \(verbs[0]) in zero gravity. Suddenly, a \(adjectives[1]) \(nouns[1]) floated in and started to \(verbs[1]). The crew panicked when a \(adjectives[2]) \(nouns[2]) joined in to \(verbs[2]). Luckily, the \(adjectives[3]) \(nouns[3]) saved the day.",

        "At the zoo, the \(adjectives[0]) \(nouns[0]) escaped and began to \(verbs[0]). The zookeeper, a \(adjectives[1]) \(nouns[1]), tried to \(verbs[1]) but failed. Things got worse when a \(adjectives[2]) \(nouns[2]) also started to \(verbs[2]). Finally, the \(adjectives[3]) \(nouns[3]) lured everyone back inside.",

        "In the kitchen, the \(adjectives[0]) \(nouns[0]) attempted to \(verbs[0]) with a frying pan. A \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]) all over the place. Soon, the \(adjectives[2]) \(nouns[2]) joined in to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) was left to clean up the mess.",

        "On the farm, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) in the barn. A \(adjectives[1]) \(nouns[1]) wandered in and began to \(verbs[1]). To add to the confusion, the \(adjectives[2]) \(nouns[2]) jumped in and tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) just laughed the whole time.",

        "At the carnival, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) on the rides. A \(adjectives[1]) \(nouns[1]) cut in line and began to \(verbs[1]). The fun turned chaotic when a \(adjectives[2]) \(nouns[2]) joined in and tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) walked away shaking its head.",

        "On the train, the \(adjectives[0]) \(nouns[0]) decided to \(verbs[0]) down the aisle. A \(adjectives[1]) \(nouns[1]) blocked the way and began to \(verbs[1]). The trip got even wilder when a \(adjectives[2]) \(nouns[2]) started to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) simply looked out the window.",

        "At the library, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) quietly. A \(adjectives[1]) \(nouns[1]) told it to \(verbs[1]) instead. Suddenly, a \(adjectives[2]) \(nouns[2]) showed up and began to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) shushed them all.",

        "On the mountain, the \(adjectives[0]) \(nouns[0]) started to \(verbs[0]) up the slope. Halfway, a \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]). A \(adjectives[2]) \(nouns[2]) tumbled down and tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) waved from the top.",
        
        "At the museum, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) near a famous painting. A \(adjectives[1]) \(nouns[1]) shouted and began to \(verbs[1]) at full volume. Meanwhile, the \(adjectives[2]) \(nouns[2]) joined in and started to \(verbs[2]) across the gallery. The poor \(adjectives[3]) \(nouns[3]) fainted in shock.",

        "On the playground, the \(adjectives[0]) \(nouns[0]) climbed up to \(verbs[0]) from the slide. Suddenly, a \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]). A group of kids pointed when the \(adjectives[2]) \(nouns[2]) rushed in to \(verbs[2]). The whole scene was watched by the \(adjectives[3]) \(nouns[3]).",

        "In the desert, the \(adjectives[0]) \(nouns[0]) was wandering and tried to \(verbs[0]). Out of nowhere, a \(adjectives[1]) \(nouns[1]) showed up and began to \(verbs[1]). The heat made the \(adjectives[2]) \(nouns[2]) start to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) just shook its head.",

        "During breakfast, the \(adjectives[0]) \(nouns[0]) attempted to \(verbs[0]) into the cereal bowl. A \(adjectives[1]) \(nouns[1]) wasn’t happy and began to \(verbs[1]). Things escalated when the \(adjectives[2]) \(nouns[2]) jumped up to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) spilled the milk everywhere.",

        "In the castle, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) through the halls. Suddenly, a \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]). Guards panicked as a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) hid behind the throne.",

        "On the stage, the \(adjectives[0]) \(nouns[0]) started to \(verbs[0]) during the play. A \(adjectives[1]) \(nouns[1]) stormed in and began to \(verbs[1]). The show took a turn when a \(adjectives[2]) \(nouns[2]) joined in to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) dropped the curtain immediately.",

        "At the beach, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) in the sand. A \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]) furiously. The fun stopped when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The whole thing was ignored by the \(adjectives[3]) \(nouns[3]).",

        "In the forest cabin, the \(adjectives[0]) \(nouns[0]) decided to \(verbs[0]) near the fireplace. Suddenly, a \(adjectives[1]) \(nouns[1]) burst in and began to \(verbs[1]). The noise woke the \(adjectives[2]) \(nouns[2]) who tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) kept roasting marshmallows anyway.",

        "At the sports game, the \(adjectives[0]) \(nouns[0]) ran onto the field to \(verbs[0]). Security, a \(adjectives[1]) \(nouns[1]), began to \(verbs[1]). The crowd went wild when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) just sold popcorn.",

        "In the city, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) across the street. Suddenly, a \(adjectives[1]) \(nouns[1]) zoomed by and began to \(verbs[1]). A shocked \(adjectives[2]) \(nouns[2]) joined in and started to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) watched from a window.",

        "At the amusement park, the \(adjectives[0]) \(nouns[0]) got on the rollercoaster to \(verbs[0]). Suddenly, a \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]) loudly. To everyone’s surprise, the \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]) too. The \(adjectives[3]) \(nouns[3]) just bought cotton candy.",

        "At the hospital, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) in the waiting room. A \(adjectives[1]) \(nouns[1]) walked in and began to \(verbs[1]). The nurses gasped as the \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) hid behind the desk.",

        "In the jungle, the \(adjectives[0]) \(nouns[0]) decided to \(verbs[0]) in the trees. A \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]). The adventure continued when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) stayed perfectly still.",

        "On the river, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) in a canoe. Suddenly, a \(adjectives[1]) \(nouns[1]) splashed in and began to \(verbs[1]). The waves rocked when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) held onto the oars.",

        "At the fair, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) near the rides. A \(adjectives[1]) \(nouns[1]) bumped into it and began to \(verbs[1]). The crowd cheered when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) munched on funnel cake.",

        "In the office, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) at the desk. A \(adjectives[1]) \(nouns[1]) appeared and began to \(verbs[1]). The boss gasped as the \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) kept typing emails.",

        "In the attic, the \(adjectives[0]) \(nouns[0]) found a box and tried to \(verbs[0]) with it. Suddenly, a \(adjectives[1]) \(nouns[1]) jumped out and began to \(verbs[1]). The mystery deepened when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) sneezed from the dust.",

        "On the highway, the \(adjectives[0]) \(nouns[0]) tried to \(verbs[0]) in the car. Suddenly, a \(adjectives[1]) \(nouns[1]) cut them off and began to \(verbs[1]). The situation got worse when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) turned up the radio.",

        "At the pool, the \(adjectives[0]) \(nouns[0]) decided to \(verbs[0]) off the diving board. A \(adjectives[1]) \(nouns[1]) jumped in and began to \(verbs[1]). The lifeguard panicked when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) splashed happily.",

        "At the market, the \(adjectives[0]) \(nouns[0]) wanted to \(verbs[0]) with the fruit. A \(adjectives[1]) \(nouns[1]) ran in and began to \(verbs[1]). Shoppers gasped when a \(adjectives[2]) \(nouns[2]) tried to \(verbs[2]). The \(adjectives[3]) \(nouns[3]) dropped the basket."

    ]
    let randomStoryIndex = Int.random(in: 0..<stories.count)

    // grab the story at that random index
    let randomStory = stories[randomStoryIndex]

    // now you can return or print it
    return randomStory
        }


print(generateMadLib(noun1: "bird", adjective1: "sleepy", verb1: "kick", noun2: "cage", adjective2: "gray", verb2: "spill", noun3: "bee", adjective3: "dirty", verb3: "learn", noun4: "caluclator", adjective4: "stripped", verb4: "pull"
))








