//
//  Color+Brand.swift
//  Calendar
//

import SwiftUI

// just a couple colors i use in the app
extension Color {
    static let appBlue = Color(hex: "5D5FEF")
    static let brandPrimary = Color(hex: "5D5FEF")
    static let brandSecondary = Color(hex: "A5A6F6")
    static let brandBackground = Color(.systemGroupedBackground)
    static let brandDark = Color(hex: "1A202C")
    static let success = Color.green
    static let warning = Color.orange
    static let danger = Color.red
    
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
