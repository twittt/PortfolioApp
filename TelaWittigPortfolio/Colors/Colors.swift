//
//  Colors.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import Foundation
import SwiftUI

enum Colors {
    static let AccentPurple = "accent_purple"
    
    static func color(_ color: String) -> Color {
        return Color(UIColor(named: color)!)
    }
}
