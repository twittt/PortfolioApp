//
//  ResumeViewModel.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation

class ResumeViewModel: ObservableObject {
    @Published var items: [ResumeListItem] = []
    
    func getResumeItems() {
        Firebase.getAllDocumentsOrderedBy(FirebaseKeys.CollectionPath.ResumeItems, orderedBy: FirebaseKeys.ResumeItem.startDate, desc: true) { result in
            switch result {
            case .success(let documents):
                self.items = documents.map({ document in
                    let data = document.data()
                    return ResumeListItem(data: data)
                })
            case .failure(let err):
                print("Failed to load social media information from Firestore: \(err)\n\(err.localizedDescription)")
            }
        }
    }
}
