//
//  Styles.swift
//  DesignCodeiOS15App
//
//  Created by SandsLee on 2022/7/27.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .top, endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}

extension Color {
    public static func hexColor(_ hex: Int, a: CGFloat = 1.0) -> Color {
        .init(.sRGB,
              red: CGFloat(hex >> 16 & 0xFF) / 255.0,
              green: CGFloat(hex >> 8 & 0xFF) / 255.0,
              blue: CGFloat(hex & 0xFF) / 255.0,
              opacity: a)
    }
}
