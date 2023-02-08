//
//  DestinationView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import SwiftUI
import CoreLocation

struct DestinationView: View {

    @EnvironmentObject var viewModel: TravelViewModel

    var body: some View {
        VStack(alignment: .leading) {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
                .accessibilityLabel("Map showing \(viewModel.featuredDestination?.name ?? "")")
                .accessibilityIdentifier("mapView")
            Text("\(viewModel.featuredDestination?.name ?? ""), \(viewModel.featuredDestination?.country ?? "")")
                .font(Fonts.font(Fonts.Poppins_Bold, 20))
                .foregroundColor(.white)
                .padding(.top)
                .padding(.leading)
                .accessibilityIdentifier("destinationName")
            Text(viewModel.featuredDestination?.description ?? "")
                .font(Fonts.font(Fonts.Poppins_Bold, 14))
                .foregroundColor(.white)
                .padding(.horizontal)
                .accessibilityIdentifier("destinationSubheading")
            if !viewModel.images.isEmpty {
                viewModel.images.first(where: { $0.id == viewModel.featuredDestination?.name })?.image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                    .accessibilityLabel("Tela in \(viewModel.featuredDestination?.name ?? "")")
                    .accessibilityIdentifier("destinationImage")
            }

            Text(viewModel.featuredDestination?.longDestription ?? "")
                .font(Fonts.font(Fonts.Poppins_Regular, 16))
                .foregroundColor(.white)
                .padding()
                .accessibilityIdentifier("destinationDescription")
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView()
    }
}
