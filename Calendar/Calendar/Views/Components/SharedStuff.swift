import SwiftUI

/// Reusable card for displaying a labeled piece of content with an icon.
struct DetailCard: View {
    /// Card title shown in the header.
    let title: String
    /// SF Symbol name for the header icon.
    let icon: String
    /// Accent color used for the icon and badge.
    let color: Color
    /// Optional body text; shows `emptyText` when nil or empty.
    let content: String?
    /// Placeholder shown when no content is available.
    let emptyText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .padding(6)
                    .background(color.opacity(0.1))
                    .clipShape(Circle())
                
                Text(title.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
            
            if let text = content, !text.isEmpty {
                Text(text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text(emptyText)
                    .font(.callout)
                    .italic()
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

/// Compact horizontal row for a single assignment.
struct AssignmentRow: View {
    /// Assignment model to display.
    let assignment: Assignment
    /// Accent color used for the leading bar.
    let color: Color
    
    var body: some View {
        // Wrapped in NavigationLink to route to AssignmentDetailView
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
        .buttonStyle(PlainButtonStyle()) // Keeps the text from turning default blue
    }
}

/// A titled, horizontally scrolling list of assignments with an empty state.
struct AssignmentSection: View {
    /// Section title.
    let title: String
    /// Items to display; when empty or nil, shows `emptyMessage`.
    let assignments: [Assignment]?
    /// Accent color passed down to rows.
    let color: Color
    /// Message shown when there are no assignments.
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

/// Small label-value tag used in the hero card.
struct MetaPill: View {
    /// Short label.
    let label: String
    /// Associated value.
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
