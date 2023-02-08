//
//  TravelViewModel.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import Foundation
import SwiftUI

class TravelViewModel: ObservableObject {
    
    @Published var destinations: [Destination] = []
    @Published var featuredDestination: Destination? = nil
    

    @Published var images: [ImageObject] = []
    
    func getDestinationsAndPublishForView(mockData: [Destination]) {
        
        
        print(mockData)
        //TODO: retrive destinations
        self.destinations = mockData
        self.featuredDestination = self.destinations[0]
        getAllImages(for: self.destinations)
    }
    
    func getAllImages(for destinations: [Destination]) {
        for d in destinations {
            CloudStorage.getImageById(collection: CloudStorageKeys.travel, documentId: d.imageName) { result in
                switch result {
                case .success(let data):
                    self.images.append(ImageObject(image: Image(uiImage: UIImage(data: data)!), id: d.name))
                    print("Sucess: \(d.name)")
                    print("***")
                case .failure(let err):
                    print("Error loading images for destination: \(err)")
                }
            }
        }
    }
    var mockData: [Destination] {
        return [Destination(data: [
            "name" : "Wuhan",
            "year" : 2017,
            "country" : "China",
            "description" : "I taught English in China for a summer",
            "longDestription" : "The summer of 2017 I spent three months in Wunhan, Hubei teaching English as a second language to kids. It was a great experience, spending time in a different country, working on my language skills, and getting REALLY comfortable speaking in public. The summer inspired in me a love for teaching which I have carried with me into my career and adult life.",
            "imageName" : "wuhan.png",
            "latitude": 30.5928,
            "longitude": 114.3052
        ]), Destination(data: [
            "name" : "Los Angeles",
            "year" : 2020,
            "country" : "California",
            "description" : "My winter vacation in 2020",
            "longDestription" : "I had never seen the west coast before and I had been meaning to visit friends from college who had settled out there after school. We had such a great time hiking & not being in the Northeast in January. This picture was taken at the top of a mountain overlooking Pasadena.",
            "imageName" : "la.png",
            "latitude": 34.0522,
            "longitude": -118.2437
        ]), Destination(data: [
            "name" : "Lisbon",
            "year" : 2022,
            "country" : "Portugal",
            "description" : "My First Time Staying in a Hostel",
            "longDestription" : "I had originally booked a one day layover in Lisbon because it was the best deal. After six hours there, I nearly cancelled my trip to stay. I will definitly be back & staying in a hostel once again.",
            "imageName" : "lisbon.png",
            "latitude": 38.7223,
            "longitude": -9.1393
        ]), Destination(data: [
            "name" : "Marseille",
            "year" : 2019,
            "country" : "France",
            "description" : "A Gorgeous City on the Mediterranean",
            "longDestription" : "On my post-grad trip to Europe my friends and I took a few days and drove down to the coast from Paris. The trip was beautiful, driving through some of the best wine regions in the world, but the city of Marseille stole my heart with phenomenal food and views.",
            "imageName" : "marseille.png",
            "latitude": 43.2965,
            "longitude": 5.3698
        ]), Destination(data: [
            "name" : "Miami",
            "year" : 2021,
            "country" : "Florida",
            "description" : "Sunshine and Amazing Mexican Food",
            "longDestription" : "In 2021 I worked pretty much non-stop to build my company and prepare it to launch in the spring. To treat myself, I took a weekend away in Miami Beach. The beach was beautiful, but the habanero mushroom tacos were by far my favorite part.",
            "imageName" : "miami.png",
            "latitude": 25.7617,
            "longitude": -80.1918
        ]), Destination(data: [
            "name" : "Paris",
            "year" : 2019,
            "country" : "France",
            "description" : "The First Stop on My Post-Grad Eurotour",
            "longDestription" : "Paris was so beautiful and this trip was my first time visiting Europe. I remember being so taken aback by how old everything was. I loved the time I spent there; it inspired my obsession with European cities.",
            "imageName" : "paris.png",
            "latitude": 48.8566,
            "longitude": 2.3522
        ]), Destination(data: [
            "name" : "Rome",
            "year" : 2022,
            "country" : "Italy",
            "description" : "Bone Crypts & Lots of Ruins",
            "longDestription" : "I was in Rome for over a week, so I did, saw, and ate absolutely everything I wanted to. By far the best thing was the Catacombs tour that I booked on a whim on my last day. I learned so much about the history of the region and the evolution of religion in Ancient Rome.",
            "imageName" : "rome.png",
            "latitude": 41.9028,
            "longitude": 12.4964
        ]),  Destination(data: [
            "name" : "San Diego",
            "year" : 2023,
            "country" : "California",
            "description" : "My First Marathon",
            "longDestription" : "My mom and I decided to fly to San Diego for my first marathon to escape the cold of the Northest in the winter. The day of the marathon was dry, but it rained every other day we were there. So, although it was not as sunny as promised, it was a great trip.",
            "imageName" : "sandiego.png",
            "latitude": 32.7157,
            "longitude": -117.1611
        ])]
    }

}

struct ImageObject {
    let image: Image
    let id: String
}
