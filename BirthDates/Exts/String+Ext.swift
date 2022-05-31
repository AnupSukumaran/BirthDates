//
//  String+Ext.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import Foundation
import UIKit

extension String {
    
    func getInitials() -> Self {
        return self.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
    
    func convertDateFormate(from: String = "yyyy-MM-dd", toFormate: String = "dd-MM-yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = toFormate
        return  dateFormatter.string(from: date!)

    }
    
}
