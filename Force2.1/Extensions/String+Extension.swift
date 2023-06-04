//
//  String+Extension.swift
//  Force2.1
//
//  Created by Joseph DeWeese on 6/4/23.
//

import Foundation

extension String {
    
    func asDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.date(from: self)
    }
}

