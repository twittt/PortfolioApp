//
//  ExtracurricularGetter.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation
import SwiftUI


final class ExtracurricularsViewModel: ObservableObject {
    @Published var extracurriculars: [Extracurricular] = Extracurricular.getMockData()

    func getExtracurricularsAndPublishForTheView() {
        Firebase.getAllDocuments(FirebaseKeys.CollectionPath.Extracurriculars) { result in
            switch result {
            case .success(let documents):
                self.extracurriculars = documents.map({ document in
                    let data = document.data()
                    return Extracurricular(data: data)
                })
            case .failure(let failure):
                print("Failed to retirieve extracurriculars from Firebase: \(failure)")
            }
        }
    }
}
