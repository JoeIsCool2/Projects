//
//  SignInModels.swift
//  Calendar
//

import Foundation

// what we send to login
struct SignInRequest: Encodable {
    let email: String
    let password: String
}

// what we get back from login
struct SignInResponseDTO: Decodable {
    let firstName: String
    let lastName: String
    let email: String
    let userUUID: UUID
    let secret: String  // the token
    let userName: String
}
