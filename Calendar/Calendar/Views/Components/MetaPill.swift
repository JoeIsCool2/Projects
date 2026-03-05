//
//  MetaPill.swift
//  Calendar
//

import SwiftUI

// little label: value tag
struct MetaPill: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(label + ":")
                .fontWeight(.medium)
            Text(value)
        }
        .font(.caption)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(6)
    }
}
