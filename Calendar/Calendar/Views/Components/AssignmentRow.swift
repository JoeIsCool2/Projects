//
//  AssignmentRow.swift
//  Calendar
//

import SwiftUI

// one assignment in the horizontal list on dashboard
struct AssignmentRow: View {
    let assignment: Assignment
    let color: Color
    
    var body: some View {
        NavigationLink(destination: AssignmentDetailView(assignment: assignment)) {
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(color)
                    .frame(width: 3)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(assignment.name)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .lineLimit(2)
                    Text(assignment.assignmentType)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .frame(width: 160, alignment: .leading)
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(6)
        }
        .buttonStyle(.plain)
    }
}
