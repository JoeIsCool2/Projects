import SwiftUI

struct Theme {
    // Palette (Hogwarts-inspired)
    static let HogwartsMidnight = Color(red: 0.08, green: 0.06, blue: 0.15) // Deep midnight purple-blue like Hogwarts at night
    static let SlytherinShadow = Color(red: 0.32, green: 0.41, blue: 0.36) // Muted green-gray like Slytherin robes or forest shadows
    static let RavenclawDusk = Color(red: 0.38, green: 0.48, blue: 0.68) // Dusk blue reminiscent of Ravenclaw tones
    static let CandlelightGlow = Color(red: 0.85, green: 0.87, blue: 0.76) // Pale parchment / soft light like candle reflection
    static let GoldenGryffindor = Color(red: 0.83, green: 0.72, blue: 0.52) // Warm gold-beige, evokes Hogwarts candlelight and Gryffindor warmth

    // Text
    static let textPrimary = Color(red: 0.97, green: 0.95, blue: 0.89) // Aged parchment white
    static let textSecondary = Color(red: 0.85, green: 0.82, blue: 0.75) // Subtle faded gold-gray for softer contrast

    // Cards
    static let cardStroke = Color(red: 0.73, green: 0.65, blue: 0.48).opacity(0.25) // Gold outline tint
    static let cardShadow = Color.black.opacity(0.45) // Deeper, more cinematic shadow

    // Feedback
    static let success = Color(red: 0.46, green: 0.73, blue: 0.44) // Soft herb green like potion color
    static let error = Color(red: 0.75, green: 0.22, blue: 0.22) // Deep crimson reminiscent of Gryffindor red
}
