//
//  ExtracurricularsView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct ExtracurricularView: View {
    let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    let transition = AnyTransition.asymmetric(insertion: .slide, removal: .scale).combined(with: .opacity)
    @StateObject var viewModel: ExtracurricularsViewModel = ExtracurricularsViewModel()
    @State private var showingIndex: Int = 0
    
    var body: some View {
        ExtracurricularCard(extracurricular: viewModel.extracurriculars[showingIndex])
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal)
            .transition(transition)
            .onReceive(timer) { time in
                self.showingIndex = showingIndex >= (viewModel.extracurriculars.count-1) ? 0 : showingIndex + 1
            }
            .animation(.default.speed(0.5), value: self.showingIndex)
    }
}
