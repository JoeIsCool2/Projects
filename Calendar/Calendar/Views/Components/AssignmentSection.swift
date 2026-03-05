//
//  AssignmentSection.swift
//  Calendar
//

import SwiftUI

// section with title and horizontal list of assignments
struct AssignmentSection: View {
    let title: String
    let assignments: [Assignment]?
    let color: Color
    let emptyMessage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            if let items = assignments, !items.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(items) { item in
                            AssignmentRow(assignment: item, color: color)
                        }
                    }
                    .padding(.horizontal)
                }
            } else {
                Text(emptyMessage)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
        }
    }
}
