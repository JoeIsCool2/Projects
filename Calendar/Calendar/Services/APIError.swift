//
//  APIError.swift
//  Calendar
//

import Foundation

// errors that can happen when calling the API
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case serverError(String)
    case decodingError(Error)
}
