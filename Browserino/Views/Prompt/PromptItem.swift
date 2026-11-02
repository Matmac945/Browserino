//
//  PromptItem.swift
//  Browserino
//
//  Created by Aleksandr Strizhnev on 10.06.2024.
//

import SwiftUI

struct PromptItem: View {
    static let height: CGFloat = 28

    var app: URL
    /// Letter shortcut the user assigned in Preferences, if any.
    var shortcut: String?
    /// Key hint shown on the right: the letter shortcut, or the row number.
    var keyHint: String?
    var selected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(nsImage: app.appIcon)
                    .resizable()
                    .frame(width: 20, height: 20)

                Text(app.appDisplayName)
                    .font(.system(size: 13))
                    .lineLimit(1)
                    .truncationMode(.tail)

                Spacer(minLength: 8)

                if let keyHint {
                    Text(keyHint)
                        .font(.system(size: 12))
                        .foregroundStyle(selected ? Color.white.opacity(0.8) : Color.secondary)
                }
            }
            .padding(.horizontal, 8)
            .frame(height: Self.height)
            .contentShape(Rectangle())
        }
        .buttonStyle(SelectButtonStyle(selected: selected))
        .if(shortcut != nil) {
            return $0.keyboardShortcut(
                KeyEquivalent(shortcut!.lowercased().first!),
                modifiers: [.shift]
            ).background {
                Button(action: action) {}
                    .opacity(0)
                    .keyboardShortcut(
                        KeyEquivalent(shortcut!.lowercased().first!),
                        modifiers: []
                    )
            }
        }
    }
}
