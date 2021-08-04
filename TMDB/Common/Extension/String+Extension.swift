//
//  String+Extension.swift
//  TMDB
//
//  Created by Yaffi Azmi on 05/08/21.
//

import UIKit

extension String {
    func toDate(format: String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    func formatDate(from: String = "yyyy-MM-dd", to: String = "dd MMM yyyy") -> String {
        return self.toDate(format: from)?.toString(format: to) ?? "There was an error decoding the string"
    }
}
