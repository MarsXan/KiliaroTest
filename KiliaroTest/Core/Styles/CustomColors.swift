//
//  CustomColors.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import SwiftUI

extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue: Double(b) / 255,
                opacity: Double(a) / 255
        )
    }

    func uiColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }

    static var p400: Color {
        .init("p400")
    }
    static var p300: Color {
        .init("p300")
    }
    static var p200: Color {
        .init("p200")
    }
    static var p100: Color {
        .init("p100")
    }
    static var p50: Color {
        .init("p50")
    }
    static var disabled_primary: Color {
        .init("disabled_primary")
    }


    static var a1_400: Color {
        .init("a1_400")
    }
    static var a1_300: Color {
        .init("a1_300")
    }
    static var a1_200: Color {
        .init("a1_200")
    }
    static var a1_100: Color {
        .init("a1_100")
    }
    static var a1_50: Color {
        .init("a1_50")
    }
    static var disabled_accent1: Color {
        .init("disabled_accent1")
    }


    static var a2_300: Color {
        .init("a2_300")
    }
    static var a2_200: Color {
        .init("a2_200")
    }
    static var a2_100: Color {
        .init("a2_100")
    }
    static var a2_50: Color {
        .init("a2_50")
    }
    static var disabled_accent2: Color {
        .init("disabled_accent2")
    }

    static var a3_400: Color {
        .init("a3_400")
    }
    static var a3_300: Color {
        .init("a3_300")
    }
    static var a3_200: Color {
        .init("a3_200")
    }
    static var a3_100: Color {
        .init("a3_100")
    }
    static var a3_50: Color {
        .init("a3_50")
    }
    static var disabled_accent3: Color {
        .init("disabled_accent3")
    }


    static var a4_500: Color {
        .init("a4_500")
    }
    static var a4_400: Color {
        .init("a4_400")
    }
    static var a4_300: Color {
        .init("a4_300")
    }
    static var a4_200: Color {
        .init("a4_200")
    }
    static var a4_100: Color {
        .init("a4_100")
    }
    static var a4_50: Color {
        .init("a4_50")
    }
    static var disabled_accent4: Color {
        .init("disabled_accent4")
    }

    static var n900: Color {
        .init("n900")
    }
    static var disabled_n900: Color {
        .init("disabled_n900")
    }
    static var n800: Color {
        .init("n800")
    }
    static var disabled_n800: Color {
        .init("disabled_n800")
    }
    static var n700: Color {
        .init("n700")
    }
    static var disabled_n700: Color {
        .init("disabled_n700")
    }
    static var n500: Color {
        .init("n500")
    }
    static var disabled_n500: Color {
        .init("disabled_n500")
    }
    static var n200: Color {
        .init("n200")
    }
    static var disabled_n200: Color {
        .init("disabled_n200")
    }
    static var n100: Color {
        .init("n100")
    }
    static var disabled_n100: Color {
        .init("disabled_n100")
    }


    static var iconColor: Color {
        .init("iconColor")
    }
    static var customWhite: Color {
        .init("customWhite")
    }
    static var customBlack: Color {
        .init("customBlack")
    }

    static var title: Color {
        .init("title")
    }
    static var selectedText: Color {
        .init("selected_text")
    }
    
    static var primaryText: Color {
        .init("primary_text")
    }
    static var secondaryText: Color {
        .init("secondary_text")
    }
    static var lightText: Color {
        .init("lightText")
    }
    static var disabled_text: Color {
        .init("disabled_text")
    }
    static var overlayGray: Color {
        .init("overlayGray")
    }
    static var background: Color {
        .init("background")
    }
    
    static var thumbnail_gradient1: Color {
        .init("thumbnail_gradient1")
    }
    
    static var thumbnail_gradient2: Color {
        .init("thumbnail_gradient2")
    }
}


extension Gradient {
    static var bMainGradient: Gradient {
        Gradient(colors: [Color(hexString: "#FE7556"), Color(hexString: "#B158F9")])
    }
}
