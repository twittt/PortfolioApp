//
//  SocialLinksView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct SocialLinksView: View {
    @ObservedObject var viewModel = SocialLinksViewModel()
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.socials) { social in
                SocialLinkView(social: social)
            }
        }
        .onAppear {
            viewModel.getSocialMediaDataAndPublishItForTheView()
        }
    }
}
