//
//  Color+Brand.swift
//  Calendar
//

import SwiftUI

// app colors and hex helper
extension Color {
    static let brandPrimary = Color(hex: "5D5FEF")
    static let brandSecondary = Color(hex: "A5A6F6")
    static let brandBackground = Color(hex: "F8F9FE")
    static let brandDark = Color(hex: "1A202C")
    static let success = Color(hex: "48BB78")
    static let warning = Color(hex: "ED8936")
    static let danger = Color(hex: "F56565")
    
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
