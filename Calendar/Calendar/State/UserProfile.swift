//
//  UserProfile.swift
//  Calendar
//

import Foundation

// saved after login so we can show name etc
struct UserProfile: Codable {
    let firstName: String
    let lastName: String
    let email: String
}
