//
//  Destination.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import Foundation
import CoreLocation

struct Destination: Identifiable, Equatable {
    var id: String = UUID().uuidString
    let name: String
    let year: Int
    let country: String
    let description: String
    let longDestription: String
    let imageName: String

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    init(data: [String:Any]) {
        
        self.name = data[FirebaseKeys.Destinations.name] as? String ?? ""
        self.year = data[FirebaseKeys.Destinations.year] as? Int ?? 0
        self.country = data[FirebaseKeys.Destinations.country] as? String ?? ""
        self.description = data[FirebaseKeys.Destinations.description] as? String ?? ""
        self.longDestription = data[FirebaseKeys.Destinations.longDestription] as? String ?? ""
        self.imageName = data[FirebaseKeys.Destinations.imageName] as? String ?? ""
        let latitude: Double = data[FirebaseKeys.Destinations.latitude] as? Double ?? 0.0
        let longitude: Double = data[FirebaseKeys.Destinations.longitude] as? Double ?? 0.0
        
        self.coordinates = Coordinates(latitude: latitude, longitude: longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
