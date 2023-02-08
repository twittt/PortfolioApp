//
//  Fonts.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

enum Fonts {
    static let Poppins_Black = "Poppins-Black"
    static let Poppins_BlackItalic = "Poppins-BlackItalic"
    static let Poppins_Bold = "Poppins-Bold"
    static let Poppins_BoldItalic = "Poppins-BoldItalic"
    static let Poppins_ExtraBold = "Poppins-ExtraBold"
    static let Poppins_ExtraBoldItalic = "Poppins-ExtraBoldItalic"
    static let Poppins_ExtraLight = "Poppins-ExtraLight"
    static let Poppins_ExtraLightItalic = "Poppins-ExtraLightItalic"
    static let Poppins_Italic = "Poppins-Italic"
    static let Poppins_Light = "Poppins-Light"
    static let Poppins_LightItalic = "Poppins-LightItalic"
    static let Poppins_Medium = "Poppins-Medium"
    static let Poppins_MediumItalic = "Poppins-MediumItalic"
    static let Poppins_Regular = "Poppins-Regular"
    static let Poppins_SemiBold = "Poppins-SemiBold"
    static let Poppins_SemiBoldItalic = "Poppins-SemiBoldItalic"
    static let Poppins_Thin = "Poppins-Thin"
    static let Poppins_ThinItalic = "Poppins-ThinItalic"
    static let GFSDidot_Regular = "GFSDidot-Regular"

    static func font(_ font: String, _ size: CGFloat) -> Font {
        return Font.custom(font, size: size)
    }
}
