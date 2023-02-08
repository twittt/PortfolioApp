//
//  Background.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct Background: View {
    
    @State var scale : CGFloat = 1
    let baseColor = Color(hue: 206.2, saturation: /*0.295*/0.0, brightness: 0.473)
    var body: some View {
        
        ZStack {
            ForEach (1...70, id:\.self) { _ in
                Circle ()
                    .foregroundColor(Color (hue: .random(in: 180...300),
                                            saturation: 0.1,
                                            brightness: 0.6))
                
                    .blendMode(.colorDodge) // The bottom circle is lightened by the top layer
                    .animation (Animation.spring (dampingFraction: 0.5)
                        .repeatForever()
                        .speed (.random(in: 0.05...0.4))
                        .delay(.random (in: 0...1)), value: scale
                    )
                    .scaleEffect(self.scale * .random(in: 0.1...3))
                    .frame(width: .random(in: 1...100),
                           height: CGFloat.random (in:20...100),
                           alignment: .center)
                    .position(CGPoint(x: .random(in: 0...1112),
                                      y: .random (in:0...834)))
            }
        }
        .onAppear {
            self.scale = 1.2
        }
        .drawingGroup(opaque: false, colorMode: .linear)
        .background(
            Rectangle()
                .foregroundColor(baseColor))
        .ignoresSafeArea()
    }
}
