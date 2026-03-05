//
//  Assignment.swift
//  Calendar
//
//  Created by joseph wright on 3/4/26.
//
import Foundation


// one assignment from the API
struct Assignment: Codable, Identifiable {
    let id: UUID
    let name: String
    let assignmentType: String
    let assignedOn: Date?
    let dueOn: Date?
    var userProgress: String?
    var body: String?
}
