import SwiftUI

/// Brand color palette and convenience init from hex.
extension Color {
    /// Primary brand color.
    static let brandPrimary = Color(hex: "5D5FEF")
    /// Secondary brand color.
    static let brandSecondary = Color(hex: "A5A6F6")
    /// App background color.
    static let brandBackground = Color(hex: "F8F9FE")
    /// Dark text color.
    static let brandDark = Color(hex: "1A202C")
    /// Success (green).
    static let success = Color(hex: "48BB78")
    /// Warning (orange).
    static let warning = Color(hex: "ED8936")
    /// Danger (red).
    static let danger = Color(hex: "F56565")
    
    /// Initialize a Color from a hex string like "#RRGGBB" or "RRGGBB".
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

/// Gives a view a white card appearance with rounded corners and subtle shadow.
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
    }
}

/// Date formatting helpers for display.
extension Date {
    /// e.g., "Tuesday, January 23" in UTC.
    func utcFormatted() -> String {
        let f = DateFormatter()
        f.dateFormat = "EEEE, MMMM d"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        return f.string(from: self)
    }
    
    /// Day-of-month number, e.g., "23" in UTC.
    func dayNumber() -> String {
        let f = DateFormatter()
        f.dateFormat = "d"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        return f.string(from: self)
    }
    
    /// Short weekday, e.g., "Tue" in UTC.
    func weekday() -> String {
        let f = DateFormatter()
        f.dateFormat = "EEE"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        return f.string(from: self)
    }
}

