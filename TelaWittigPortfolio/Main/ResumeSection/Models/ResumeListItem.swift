//
//  ResumeListItem.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation
import FirebaseFirestore

struct ResumeListItem: Identifiable {
    
    let startDate: Date
    let endDate: Date?
    let company: String
    let title: String
    let responsibilities: [String]
    let city: String
    let state: String
    var id: String {
        return title + company
    }
    
    init(data: [String:Any]) {
        let start = data[FirebaseKeys.ResumeItem.startDate] as? Timestamp ?? Timestamp(date: Date())
        startDate = start.dateValue()
        let end = data[FirebaseKeys.ResumeItem.endDate] as? Timestamp ?? Timestamp(date: Date())
        endDate = end.dateValue()
        company = data[FirebaseKeys.ResumeItem.company] as? String ?? ""
        title = data[FirebaseKeys.ResumeItem.title] as? String ?? ""
        responsibilities = data[FirebaseKeys.ResumeItem.responsibilities] as? [String] ?? []
        city = data[FirebaseKeys.ResumeItem.city] as? String ?? ""
        state = data[FirebaseKeys.ResumeItem.state] as? String ?? ""
    }
    init(startDate: Date, endDate: Date?, company: String, title: String, responsibilities: [String], city: String, state: String) {
        self.startDate = startDate
        self.endDate = endDate
        self.company = company
        self.title = title
        self.responsibilities = responsibilities
        self.city = city
        self.state = state
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM y"
        return formatter
    }
}
