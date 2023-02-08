//
//  CloudStorageNetworking.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/7/23.
//

import Foundation
import FirebaseStorage

enum CloudStorage {
    
    static func getImageById(collection: String, documentId: String, completion: @escaping (Result<Data, Error>) -> ()) {
        let reference = Storage
            .storage()
            .reference()
            .child(collection)
            .child(documentId)
        reference.getData(maxSize: 1 * 1024 * 1024) { data, err in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let data = data else {
                return
            }
            completion(.success(data))
        }
    }
}
