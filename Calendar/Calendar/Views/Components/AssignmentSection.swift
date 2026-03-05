//
//  AssignmentSection.swift
//  Calendar
//

import SwiftUI

// section with a title and horizontal list of assignments (or empty message)
struct AssignmentSection: View {
    let title: String
    let assignments: [Assignment]?
    let color: Color
    let emptyMessage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            if let items = assignments, !items.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(items) { item in
                            AssignmentRow(assignment: item, color: color)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
            } else {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text(emptyMessage)
                }
                .foregroundColor(.secondary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal)
            }
        }
    }
}
