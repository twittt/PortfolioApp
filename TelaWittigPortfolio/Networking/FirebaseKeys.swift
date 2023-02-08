//
//  FirebaseKeys.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation

enum FirebaseKeys {
    
    enum CollectionPath {
        static let Socials = "socials"
        static let ResumeItems = "resumeItems"
        static let TravelDestinations = "destinations"
        static let Extracurriculars = "extracurriculars"
    }
    
    enum Socials {
        static let bannerImageRef = "bannerImageRef"
        static let channel = "channel"
        static let headline = "headline"
        static let stringUrl = "stringUrl"
        static let username = "username"
    }
    enum ResumeItem {
        static let startDate = "startDate"
        static let endDate = "endDate"
        static let company = "company"
        static let city = "city"
        static let state = "state"
        static let responsibilities = "responsibilities"
        static let title = "title"
    }
    enum Destinations {
        static let name = "name"
        static let year = "year"
        static let country = "country"
        static let description = "description"
        static let longDestription = "longDestription"
        static let imageName = "imageName"
        static let latitude = "latitude"
        static let longitude = "longitude"
    }
    enum Extracurricular {
        static let id = "id"
        static let title = "title"
        static let description = "description"
        static let imageRef = "imageRef"
        static let imageName = "imageName"
    }
}
