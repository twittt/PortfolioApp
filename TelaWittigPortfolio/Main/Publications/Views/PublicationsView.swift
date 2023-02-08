//
//  PublicationsView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct PublicationsView: View {
    var podcastUrlString: String = "https://pirates-eye-podcast.podbean.com/e/pirate-s-eye-on-tela-wittig-19-ep-24/"
    var forbesUrlString: String = "https://www.forbes.com/sites/stevencress/2018/02/25/march-madness-for-stocks-cresscaps-roboresearch-top-picks-on-seasonal-patterns/?sh=23e832ee6d92"
    var body: some View {
        VStack {
            NavigationLink(destination: DetailWebView(model: WebViewModel(link: podcastUrlString))) {
                VStack(spacing: 0) {
                    Image("pirates_eye_flyer")
                        .resizable()
                        .scaledToFit()

                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .accessibilityLabel("Flyer saying Pirate's Eye on Tela Wittig class of 2019")
                    Text("I talk mentorship, networking, and my decision to pursue software development on the Seton Hall University alumni podcast")
                        .font(Fonts.font(Fonts.Poppins_Italic, 14))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .accessibilityAddTraits(.isLink)
            
            NavigationLink(destination: DetailWebView(model: WebViewModel(link: forbesUrlString))) {
                VStack(spacing: 0) {
                    Image("forbes")
                        .resizable()
                        .scaledToFit()

                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .accessibilityLabel("Forbes article titled: March Madness For Stocks: CressCap's RoboResearch Top PicksOn Seasonal Patterns")
                    Text("Founder of CressCap, Steven Cress, and I co-authored Forbes.com articles using CressCap's quant research")
                        .font(Fonts.font(Fonts.Poppins_Italic, 14))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .accessibilityAddTraits(.isLink)
            }
        }
    }
}

struct PublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        PublicationsView()
    }
}
