//
//  MoviePopularReviewListViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 06/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListPopularReviewListTableViewCell: UITableViewCell {

    static let identifier = "MovieListPopularReviewListTableViewCell"
    
    let authorAvatarImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .lightGray
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 25
        return img
    }()
    
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 10)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(authorAvatarImage)
        contentView.addSubview(authorNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(contentLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(review: MoviePopularDetailViewModel.ViewModel.Reviews) {
        authorAvatarImage.setImageWith(path: review.avatarPath)
        authorNameLabel.text = review.name
        usernameLabel.text = review.username
        contentLabel.text = review.content
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        authorAvatarImage.anchor(top: topAnchor, paddingTop: 16,
                           bottom: bottomAnchor, paddingBottom: 16,
                           left: leftAnchor, paddingLeft: 24,
                           right: nil, paddingRight: 0,
                           width: 50, height: 50)
        
        authorNameLabel.anchor(top: authorAvatarImage.topAnchor, paddingTop: 0,
                          bottom: nil, paddingBottom: 0,
                          left: authorAvatarImage.rightAnchor, paddingLeft: 16,
                          right: rightAnchor, paddingRight: 24,
                          width: 0, height: 0)
        
        usernameLabel.anchor(top: authorNameLabel.bottomAnchor, paddingTop: 0,
                          bottom: nil, paddingBottom: 0,
                          left: authorAvatarImage.rightAnchor, paddingLeft: 16,
                          right: rightAnchor, paddingRight: 24,
                          width: 0, height: 0)
        
        contentLabel.anchor(top: usernameLabel.bottomAnchor, paddingTop: 0,
                          bottom: nil, paddingBottom: 0,
                          left: authorAvatarImage.rightAnchor, paddingLeft: 16,
                          right: rightAnchor, paddingRight: 24,
                          width: 0, height: 0)
    }

}

class MoviePopularReviewListViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        return table
    }()
    
    private var bag = DisposeBag()
    var reviews: [MoviePopularDetailViewModel.ViewModel.Reviews] = []
    var _reviews = PublishSubject<[MoviePopularDetailViewModel.ViewModel.Reviews]>()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Movie Reviews"
        view.addSubview(tableView)
        
        tableView.rx.setDelegate(self).disposed(by: bag)
        
        bindTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func bindTableView() {
        tableView.register(MovieListPopularReviewListTableViewCell.self,
                           forCellReuseIdentifier: MovieListPopularReviewListTableViewCell.identifier)
        
        // Bind items to table
        _reviews.bind(
            to: tableView.rx.items(cellIdentifier: MovieListPopularReviewListTableViewCell.identifier,
                                   cellType: MovieListPopularReviewListTableViewCell.self)
        ) { row, item, cell in
            cell.setupViews(review: item)
        }.disposed(by: bag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(MoviePopularDetailViewModel.ViewModel.Reviews.self).bind { [weak self] popular in
            
        }.disposed(by: bag)
        
        _reviews.onNext(reviews)
        _reviews.onCompleted()
    }
}

extension MoviePopularReviewListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}


