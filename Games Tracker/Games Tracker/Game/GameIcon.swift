import SwiftUI

enum GameIcon: String, CaseIterable, Codable, Sendable, Hashable, Identifiable {
    // General gaming
    case gamecontroller = "gamecontroller"
    case joystick = "arcade.stick"
    case dieFace1 = "die.face.1"
    case dieFace2 = "die.face.2"
    case dieFace3 = "die.face.3"
    case dieFace4 = "die.face.4"
    case dieFace5 = "die.face.5"
    case dieFace6 = "die.face.6"
    
    // Achievements & rewards
    case star = "star.fill"
    case crown = "crown.fill"
    case trophy = "trophy.fill"
    case medal = "medal.fill"
    case rosette = "rosette"
    
    // Combat / adventure
    case dumbbell = "dumbbell.fill"
    case shield = "shield.fill"
    case target = "target"
    case flame = "flame.fill"
    case bolt = "bolt.fill"
    
    // Characters & fantasy
    case person = "person.fill"
    case figureRun = "figure.run"
    case figureWalk = "figure.walk"
    case figureWave = "figure.wave"
    case figureArchery = "figure.archery"
    
    // Misc fun
    case puzzle = "puzzlepiece.fill"
    case cube = "cube.fill"
    case diamond = "diamond.fill"
    case heart = "heart.fill"
    case musicNote = "music.note"
    
    var id: Self { self }
}
