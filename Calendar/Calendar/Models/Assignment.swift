//
//  Assignment.swift
//  Calendar
//
//  Created by joseph wright on 3/4/26.
//
import Foundation


/// A single assignment item with optional assigned/due dates.
struct Assignment: Codable, Identifiable {
    let id: UUID
    let name: String
    let assignmentType: String
    let assignedOn: Date?
    let dueOn: Date?
    
    // NEW: Tracks completion status from the server
    var userProgress: String? 
    var body: String? // Adding body as per your API docs
}
