//
//  SocialLinksViewModel.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

class SocialLinksViewModel: ObservableObject {
    @Published var socials: [SocialMedia] = []
    
    func getSocialMediaDataAndPublishItForTheView() {
        Firebase.getAllDocuments(FirebaseKeys.CollectionPath.Socials) { result in
            switch result {
            case .success(let documents):
                self.socials = documents.map({ document in
                    let data = document.data()
                    return SocialMedia(data: data)
                })
            case .failure(let err):
                print("Failed to load social media information from Firestore: \(err)\n\(err.localizedDescription)")
            }
        }
    }
}
