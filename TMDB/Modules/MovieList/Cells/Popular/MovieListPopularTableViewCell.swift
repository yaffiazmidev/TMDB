//
//  MovieListPopularTableViewCell.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit

class MovieListPopularTableViewCell: UITableViewCell {
        
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.backgroundColor = .red
        return img
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(posterImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImage.frame = bounds
        layoutIfNeeded()
    }
}
