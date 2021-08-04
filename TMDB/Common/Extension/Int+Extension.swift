//
//  Int+Extension.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit

extension Int {
    func minutesToHM() -> String {
      return "\(self * 60 / 3600)h \((self * 60 % 3600) / 60)m"
    }
}
