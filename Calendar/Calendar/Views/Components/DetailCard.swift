//
//  DetailCard.swift
//  Calendar
//

import SwiftUI

// card that shows a title and content
struct DetailCard: View {
    let title: String
    let icon: String
    let color: Color
    let content: String?
    let emptyText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                    .foregroundColor(color)
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            
            if let text = content, !text.isEmpty {
                Text(text)
                    .font(.body)
            } else {
                Text(emptyText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(8)
    }
}
