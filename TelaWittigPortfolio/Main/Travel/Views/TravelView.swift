//
//  TravelView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import SwiftUI

struct TravelView: View {
    @StateObject var viewModel = TravelViewModel()
    var body: some View {
        VStack {
            Image("travel_banner")
                .resizable()
                .scaledToFit()
                .accessibilityLabel("Tela in front of the colosseum")
            Text("I love to travel & explore. Tap below to see where I've been so far!")
                .font(Fonts.font(Fonts.Poppins_SemiBold, 16))
                .padding()
            NavigationLink(destination: TravelDetailView().environmentObject(viewModel)) {
                Text("See Where I've Been")
                    .font(Fonts.font(Fonts.Poppins_Regular, 20))
                    .foregroundColor(.white)
                    .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
                    .background(Colors.color(Colors.AccentPurple))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.bottom)
                    .padding(.vertical)
            }
            .accessibilityAddTraits(.isButton)
        }
        .background(Color.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(.horizontal)
        .padding(.bottom, 20)
        .onAppear {
            viewModel.getDestinationsAndPublishForView(mockData: viewModel.mockData)
        }
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView()
    }
}
