//
//  ProgressUpdateRequest.swift
//  Calendar
//

import Foundation

// body for the assignment progress API
struct ProgressUpdateRequest: Encodable {
    let assignmentID: UUID
    let progress: String
}
