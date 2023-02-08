//
//  CustomModifiers.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/8/23.
//

import SwiftUI

struct SectionTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Fonts.font(Fonts.Poppins_Bold, 20))
            .foregroundColor(.white)
            .padding(.leading)
        
    }
}
struct SocialButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Colors.color(Colors.AccentPurple))
            .frame(width: 50)
            .clipShape(Circle())
    }
}
