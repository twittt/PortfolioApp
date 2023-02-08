//
//  TravelTests.swift
//  TelaWittigPortfolioTests
//
//  Created by Tela Wittig on 2/8/23.
//

import XCTest

final class TravelTests: XCTestCase {
    
    //Mock Destinations
    private let destination1 = Destination(data: [
        "name" : "Rome",
        "year" : 2022,
        "country" : "Italy",
        "description" : "Bone Crypts & Lots of Ruins",
        "longDestription" : "I was in Rome for over a week, so I did, saw, and ate absolutely everything I wanted to. By far the best thing was the Catacombs tour that I booked on a whim on my last day. I learned so much about the history of the region and the evolution of religion in Ancient Rome.",
        "imageName" : "rome.png",
        "latitude": 41.9028,
        "longitude": 12.4964
    ])
    private let destination2 = Destination(data: [
        "name" : "San Diego",
        "year" : 2023,
        "country" : "California",
        "description" : "My First Marathon",
        "longDestription" : "My mom and I decided to fly to San Diego for my first marathon to escape the cold of the Northest in the winter. The day of the marathon was dry, but it rained every other day we were there. So, although it was not as sunny as promised, it was a great trip.",
        "imageName" : "sandiego.png",
        "latitude": 32.7157,
        "longitude": -117.1611
    ])
    
    func testFeaturedDestinationWithNoDestinations() throws {
        let viewModel = TravelViewModel()
        viewModel.getDestinationsAndPublishForView(mockData: [])
        XCTAssertFalse(viewModel.featuredDestination.exists)
    }
    func testFeaturedDestinationWithFeaturedDestination() throws {
        let viewModel = TravelViewModel()
        viewModel.getDestinationsAndPublishForView(mockData: [destination1, destination2])
        let featuredDestination = viewModel.featuredDestination
        XCTAssertTrue(featuredDestination.exists)
        XCTAssertEqual(featuredDestination.name, "Rome")
    }
}
