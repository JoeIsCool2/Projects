//
//  MetaPill.swift
//  Calendar
//

import SwiftUI

// little label: value tag used in the hero card
struct MetaPill: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 6) {
            Text(label + ":")
                .fontWeight(.bold)
                .opacity(0.7)
            Text(value)
                .fontWeight(.medium)
        }
        .font(.caption)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.black.opacity(0.2))
        .cornerRadius(8)
        .foregroundColor(.white)
    }
}
