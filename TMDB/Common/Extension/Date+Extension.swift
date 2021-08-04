//
//  Date+Extension.swift
//  TMDB
//
//  Created by Yaffi Azmi on 05/08/21.
//

import UIKit

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
