//
//  MovieListPopularTableViewCell.swift
//  TMDB
//
//  Created by Yaffi Azmi on 06/08/21.
//

import UIKit

class MovieListPopularTableViewCell: UITableViewCell {

    static let identifier = "MovieListPopularTableViewCell"
    
    let backgroundImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .lightGray
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .lightGray
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 25
        return img
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .yellow
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(backgroundImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(popular: MovieListViewModel.ViewModel.Popular) {
        backgroundImage.setImageWith(path: popular.backdropPath)
        posterImage.setImageWith(path: popular.posterPath)
        titleLabel.text = popular.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImage.anchor(top: topAnchor, paddingTop: 0,
                               bottom: nil, paddingBottom: 0,
                               left: leftAnchor, paddingLeft: 0,
                               right: rightAnchor, paddingRight: 0,
                               width: 0, height: 200)
        
        posterImage.anchor(top: backgroundImage.bottomAnchor, paddingTop: 16,
                           bottom: bottomAnchor, paddingBottom: 32,
                           left: leftAnchor, paddingLeft: 24,
                           right: nil, paddingRight: 0,
                           width: 50, height: 50)
        
        titleLabel.anchor(top: posterImage.topAnchor, paddingTop: 0,
                          bottom: posterImage.bottomAnchor, paddingBottom: 0,
                          left: posterImage.rightAnchor, paddingLeft: 16,
                          right: rightAnchor, paddingRight: 24,
                          width: 0, height: 0)
    }

}
