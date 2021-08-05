//
//  ProductTableViewCell.swift
//  TMDB
//
//  Created by Yaffi Azmi on 06/08/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    let backgroundImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .black
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backgroundImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImage.anchor(top: topAnchor, paddingTop: 0,
                               bottom: bottomAnchor, paddingBottom: 16,
                               left: leftAnchor, paddingLeft: 32,
                               right: rightAnchor, paddingRight: 32,
                               width: 0, height: 200)
    }
}
