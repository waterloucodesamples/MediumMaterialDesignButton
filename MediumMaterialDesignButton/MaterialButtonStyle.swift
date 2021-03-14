//
//  MaterialButtonStyle.swift
//  MediumMaterialDesignButton
//
//  Created by Water Lou on 14/3/2021.
//

import SwiftUI

public enum MaterialColor {
    
    case accent
    case primary
    case secondary
    case success
    case danger
    case warning
    case info
    case light
    case dark
    
    public var color: Color {
        switch self {
        case .accent:
            return Color.accentColor
        case .primary:
            return Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        case .secondary:
            return Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        case .success:
            return Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case .danger:
            return Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        case .warning:
            return Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        case .info:
            return Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        case .light:
            return Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        case .dark:
            return Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }
    }
    
    public var textColor: Color {
        
        switch self {
        case .primary, .secondary, .success, .danger, .warning, .info, .dark:
            return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        case .light:
            return Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        default:
            // select text color depending on the background color
            var grayscale: CGFloat = 0
            var alpha: CGFloat = 0
            if #available(iOS 14.0, *) {
                if UIColor(color).getWhite(&grayscale, alpha: &alpha) {
                    if grayscale < 0.5 {
                        return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                    }
                }
            }
            return Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
}


public struct MaterialButtonStyle: ButtonStyle {
    
    public let color: MaterialColor
    public let cornerRadius: CGFloat
    public let borderWidth: CGFloat
    public let maxWidth: Bool
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(minWidth: 44.0, maxWidth: maxWidth ? .infinity : nil, minHeight: 44.0)
            .padding([.leading, .trailing], 16.0)
            .foregroundColor(color.textColor)
            .background(
                GeometryReader { metrics in
                    let scale = max(metrics.size.width / metrics.size.height, metrics.size.height / metrics.size.width) * 1.1
                    ZStack {
                        // Solid fill
                        RoundedRectangle(cornerRadius: cornerRadius).fill(color.color).shadow(color: Color(.sRGB, white: 0, opacity: 0.3), radius: (configuration.isPressed ? 8 : 2), x: 0, y: 2)
                        // tap effect
                        Circle().fill(Color.white).scaleEffect(configuration.isPressed ? scale : 0.0001).opacity(configuration.isPressed ? 0.6 : 0.0).cornerRadius(cornerRadius)
                    }
                }
            )
            .overlay(
                // border
                RoundedRectangle(cornerRadius: cornerRadius).stroke(color.color, lineWidth: borderWidth).opacity(0.2)
            )
            .animation(.easeInOut(duration: 0.15))
    }
    
    public init(color: MaterialColor = .accent, cornerRadius: CGFloat = 4.0, borderWidth: CGFloat = 1.0, maxWidth: Bool = false) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.maxWidth = maxWidth
    }
}
