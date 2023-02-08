//
//  DateExtensions.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//
import Foundation

extension Date {
    func weeks() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
    }
    
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
