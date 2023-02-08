//
//  ExtracurricularCard.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct ExtracurricularCard: View {
    var extracurricular: Extracurricular

    var body: some View {
        extracurricular.image
            .resizable()
            .scaledToFit()
            .accessibilityLabel("Tela \(extracurricular.title)")
            .overlay {
                TextOverlay(extracurricular: extracurricular)
            }
    }
}

struct TextOverlay: View {
    var extracurricular: Extracurricular

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(extracurricular.title)
                    .font(.title)
                    .bold()
                Text(extracurricular.description)
            }
            .padding()
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(extracurricular.title) - \(extracurricular.description)")
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        ExtracurricularCard(extracurricular: ExtracurricularsViewModel().extracurriculars[0])
    }
}
