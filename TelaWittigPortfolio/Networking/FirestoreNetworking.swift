//
//  FirestoreNetworking.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation
import FirebaseFirestore

enum Firebase {
    
    static func getAllDocuments(_ collection: String, completion: @escaping (Result<[QueryDocumentSnapshot], Error>) -> ()) {
        let reference = Firestore
            .firestore()
            .collection(collection)

        reference.getDocuments { documents, err in
            if err != nil {
                print("\(err!)")
            }
            guard let documents = documents?.documents else {
                print(FirestoreError.noDocuments)
                completion(.failure(FirestoreError.noDocuments))
                return
            }
            completion(.success(documents))
        }
    }
    static func getAllDocumentsOrderedBy(_ collection: String, orderedBy: String, desc: Bool, completion: @escaping (Result<[QueryDocumentSnapshot], Error>) -> ()) {
        let reference = Firestore
            .firestore()
            .collection(collection)
            .order(by: orderedBy, descending: desc)

        reference.getDocuments { documents, err in
            if err != nil {
                print("\(err!)")
                completion(.failure(err!))
            }
            guard let documents = documents?.documents else {
                print(FirestoreError.noDocuments)
                completion(.failure(FirestoreError.noDocuments))
                return
            }
            completion(.success(documents))
        }
    }
}
