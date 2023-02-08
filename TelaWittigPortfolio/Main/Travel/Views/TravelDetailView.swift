//
//  TravelDetailView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import SwiftUI

struct TravelDetailView: View {
    @EnvironmentObject var viewModel: TravelViewModel
    
    var otherDestinations: [Destination] {
        return viewModel.destinations.filter({ $0.id != viewModel.featuredDestination?.id })
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            ScrollViewReader { value in
                ScrollView {
                    VStack(alignment: .leading) {
                        if viewModel.featuredDestination != nil {
                            DestinationView()
                                .id(0)
                        }
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach (otherDestinations) { d in
                                Button {
                                    withAnimation {
                                        viewModel.featuredDestination = d
                                        value.scrollTo(0, anchor: .top)
                                    }
                                } label: {
                                    VStack {
                                        viewModel.images.first(where: { $0.id == d.name })?.image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                            .accessibilityHidden(true)
                                        Text(d.name)
                                            .font(Fonts.font(Fonts.Poppins_Bold, 14))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }.scrollIndicators(.hidden)
                }
            }
        }
        .navigationTitle("My Travels")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct TravelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TravelDetailView()
    }
}
