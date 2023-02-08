//
//  Errors.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation

enum FirestoreError: Error {
    case noDocumentSnapshot
    case noSnapshotData
    case noDocuments
    case errorAddingNewDocument
    case documentReferenceEmpty
}
