//
//  MapView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import SwiftUI
import MapKit
import UIKit

struct MapView: View {
    @EnvironmentObject var viewModel: TravelViewModel
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear(perform: setRegion)
            .onChange(of: viewModel.featuredDestination, perform: { _ in
                setRegion()
            })
    }

    private func setRegion() {
        region = MKCoordinateRegion(
            center: viewModel.featuredDestination!.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
