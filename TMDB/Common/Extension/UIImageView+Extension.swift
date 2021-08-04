//
//  UIImageView+Extension.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit
import Kingfisher

enum ImageResolution: String {
    case original = "original"
    case w1280 = "w1280"
    case w780 = "w780"
    case w500 = "w500"
    case w342 = "w342"
    case w300 = "w300"
}

extension UIImageView {
    func setImageWith(path: String, resolution: ImageResolution = .w300) {
        if let _url = URL(string: "https://image.tmdb.org/t/p/\(resolution.rawValue)\(path)") {
            self.kf.setImage(with: _url)
        }
    }
}
