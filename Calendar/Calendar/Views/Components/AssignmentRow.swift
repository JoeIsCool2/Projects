//
//  AssignmentRow.swift
//  Calendar
//

import SwiftUI

// one assignment in a list with a colored bar on the side
struct AssignmentRow: View {
    let assignment: Assignment
    let color: Color
    
    var body: some View {
        NavigationLink(destination: AssignmentDetailView(assignment: assignment)) {
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(color)
                    .frame(width: 4)
                    .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(assignment.name)
                        .font(.headline)
                        .lineLimit(2)
                    
                    Text(assignment.assignmentType.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                }
            }
            .padding()
            .frame(width: 200, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
