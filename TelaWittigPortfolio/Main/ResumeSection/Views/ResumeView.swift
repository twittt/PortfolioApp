//
//  ResumeView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct ResumeView: View {
    @ObservedObject var viewModel = ResumeViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(self.viewModel.items) { item in
                ResumeListItemView(resumeItem: item)
            }
        }
        .padding(8)
        .padding(.bottom, 10)
        .background(Color.white.opacity(0.5))
        .cornerRadius(5)
        .padding(.horizontal)
        .onAppear {
            viewModel.getResumeItems()
        }
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}
