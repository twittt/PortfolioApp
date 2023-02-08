//
//  Extracurricular.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Extracurricular: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var imageRef: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(data: [String:Any]) {
        self.id = data[FirebaseKeys.Extracurricular.id] as? Int ?? 0
        self.title = data[FirebaseKeys.Extracurricular.title] as? String ?? ""
        self.description = data[FirebaseKeys.Extracurricular.description] as? String ?? ""
        self.imageRef = data[FirebaseKeys.Extracurricular.imageRef] as? Bool ?? true
        self.imageName = data[FirebaseKeys.Extracurricular.imageName] as? String ?? ""
    }
    
    init(id: Int, title: String, description: String, imageRef: Bool, imageName: String) {
        self.id = id
        self.title = title
        self.description = description
        self.imageRef = imageRef
        self.imageName = imageName
    }

    static func getMockData() -> [Extracurricular] {
        return [Extracurricular(id: 1, title: "Running", description: "I ran my first marathon this past January", imageRef: true, imageName: "marathon"), Extracurricular(id: 2, title: "Alumni", description: "I volunteer with my alumni network", imageRef: true, imageName: "yac"), Extracurricular(id: 3, title: "Election Working", description: "Every year I'm an election worker here in NY", imageRef: true, imageName: "election")]
    }
}
