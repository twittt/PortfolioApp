//
//  SocialLinkView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct SocialLinkView: View {
    
    var social: SocialMedia
    
    var body: some View {
        NavigationLink(destination: DetailWebView(model: WebViewModel(link: social.urlString))) {
            VStack(alignment: .leading) {
                ZStack {
                    VStack {
                        Image(social.coverImage)
                            .resizable()
                            .scaledToFill()
                        Rectangle()
                            .background(Color.white.opacity(0.0))
                            .foregroundColor(.clear)
                            .frame(height: 45)
                    }
                    HStack {
                        Image("socials_profile_pic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .clipShape(Circle())
                            .padding(.top, 40)
                            .padding(.leading, 10)
                        Spacer()
                    }

                }
                VStack(alignment: .leading) {

                    Text("Tela Wittig")
                        .font(Fonts.font(Fonts.Poppins_SemiBold, 22))
                        .foregroundColor(.darkText)
                    Text(social.headline)
                        .font(Fonts.font(Fonts.Poppins_Regular, 16))
                        .foregroundColor(.darkText)
                        .multilineTextAlignment(.leading)
                        
                    HStack {
                        Text("View on ")
                            .font(Fonts.font(Fonts.Poppins_Regular, 20))
                            .foregroundColor(.black.opacity(0.7))
                        +
                        Text(SocialMediaChannel.getTitle(social.channel))
                            .font(Fonts.font(Fonts.Poppins_SemiBold, 20))
                            .foregroundColor(.black.opacity(0.7))
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(.black.opacity(0.7))
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal, 10)
            }
            .background(Color.white.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal)
            .padding(.bottom, 20)
            .accessibilityAddTraits(.isLink)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(SocialMediaChannel.getTitle(social.channel)) profile")
        }
    }
    
}

struct SocialLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SocialLinkView(social: SocialMedia(data: [:]))
    }
}
