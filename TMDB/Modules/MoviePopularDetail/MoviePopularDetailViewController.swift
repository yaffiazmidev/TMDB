//
//  MoviePopularDetailViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit
import RxSwift

protocol MoviePopularDetailDisplayLogic: AnyObject {
    func displayPopularDetail(detail: MoviePopularDetailViewModel.ViewModel.Detail)
    func displayPopularReviews(reviewList: [MoviePopularDetailViewModel.ViewModel.Reviews])
}

class MoviePopularDetailViewController: UIViewController {
    
    let closeIcon: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.image = UIImage(systemName: "xmark.circle")
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.frame = CGRect(x: 24, y: 50, width: 32, height: 32)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    let backgroundImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .black
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .white
        img.layer.cornerRadius = 16
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let ratingIcon: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.image = UIImage(systemName: "star.fill")
        img.contentMode = .scaleAspectFit
        img.tintColor = .yellow
        return img
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    let seeReviewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.text = "See all reviews"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    var interactor: MoviePopularDetailInteractorBusinessLogic?
    var router: MoviePopularDetailRoutingLogic?
    private var bag = DisposeBag()
    
    var movieId: Int?
    var populars = PublishSubject<MoviePopularDetailViewModel.ViewModel.Detail>()
    var reviews: [MoviePopularDetailViewModel.ViewModel.Reviews] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        bindComponent()
        
        let didTapGestureCloseIcon = UITapGestureRecognizer(target: self, action: #selector(onDismiss))
        closeIcon.addGestureRecognizer(didTapGestureCloseIcon)
        
        let didTapGestureSeeAllReviewsLabel = UITapGestureRecognizer(target: self, action: #selector(didClickSeeAllReviewsLabel))
        seeReviewsLabel.addGestureRecognizer(didTapGestureSeeAllReviewsLabel)
    }
    
    @objc func didClickSeeAllReviewsLabel() {
        let vc = MoviePopularReviewListViewController()
        vc.reviews = reviews
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(backgroundImage)
        view.addSubview(posterImage)
        view.addSubview(closeIcon)
        view.addSubview(titleLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(durationLabel)
        view.addSubview(ratingIcon)
        view.addSubview(ratingLabel)
        view.addSubview(overviewLabel)
        view.addSubview(seeReviewsLabel)
        
        let gradient = CAGradientLayer()
        gradient.frame = backgroundImage.bounds
        gradient.colors = [UIColor.clear.cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3482875192).cgColor]
        backgroundImage.layer.insertSublayer(gradient, at: 0)
        
        backgroundImage.anchor(
            top: view.topAnchor, paddingTop: 0,
            bottom: nil, paddingBottom: 0,
            left: view.leftAnchor, paddingLeft: 0,
            right: view.rightAnchor, paddingRight: 0,
            width: 0, height: 350)
        
        posterImage.anchor(
            top: nil, paddingTop: 0,
            bottom: backgroundImage.bottomAnchor, paddingBottom: -40,
            left: view.leftAnchor, paddingLeft: 24,
            right: nil, paddingRight: 0,
            width: 120, height: 170)
        
        titleLabel.anchor(
            top: nil, paddingTop: 0,
            bottom: nil, paddingBottom: 0,
            left: posterImage.rightAnchor, paddingLeft: 16,
            right: view.rightAnchor, paddingRight: 16,
            width: 0, height: 0)
        
        releaseDateLabel.anchor(
            top: titleLabel.bottomAnchor, paddingTop: 8,
            bottom: nil, paddingBottom: 0,
            left: posterImage.rightAnchor, paddingLeft: 16,
            right: view.rightAnchor, paddingRight: 16,
            width: 0, height: 0)
        
        durationLabel.anchor(
            top: releaseDateLabel.bottomAnchor, paddingTop: 0,
            bottom: nil, paddingBottom: 0,
            left: posterImage.rightAnchor, paddingLeft: 16,
            right: view.rightAnchor, paddingRight: 16,
            width: 0, height: 0)
        
        ratingIcon.anchor(
            top: durationLabel.bottomAnchor, paddingTop: 4,
            bottom: backgroundImage.bottomAnchor, paddingBottom: 8,
            left: posterImage.rightAnchor, paddingLeft: 16,
            right: ratingLabel.leftAnchor, paddingRight: 0,
            width: 24, height: 24)
        
        ratingLabel.anchor(
            top: nil, paddingTop: 0,
            bottom: ratingIcon.bottomAnchor, paddingBottom: 0,
            left: ratingIcon.rightAnchor, paddingLeft: 0,
            right: nil, paddingRight: 0,
            width: 0, height: 24)
        
        seeReviewsLabel.anchor(
            top: nil, paddingTop: 0,
            bottom: ratingIcon.bottomAnchor, paddingBottom: 0,
            left: ratingLabel.rightAnchor, paddingLeft: 8,
            right: view.rightAnchor, paddingRight: 16,
            width: 0, height: 24)
        
        overviewLabel.anchor(
            top: posterImage.bottomAnchor, paddingTop: 16,
            bottom: nil, paddingBottom: 0,
            left: view.leftAnchor, paddingLeft: 24,
            right: view.rightAnchor, paddingRight: 24,
            width: 0, height: 0)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        MoviePopularDetailRouter.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindComponent() {
        populars.subscribe(onNext: { [weak self] popular in
            self?.titleLabel.text = popular.title
            self?.releaseDateLabel.text = "Release Date: \(popular.releaseDate.formatDate())"
            self?.durationLabel.text = "Duration: \(popular.duration.minutesToHM())"
            self?.ratingLabel.text = "\(popular.rating) (IMDb)"
            self?.overviewLabel.text = popular.overview
            self?.posterImage.setImageWith(path: popular.posterPath)
            self?.backgroundImage.setImageWith(path: popular.backdropPath, resolution: .original)
        }).disposed(by: bag)
        
        interactor?.fetchPopularDetail(id: movieId ?? 0)
        interactor?.fetchPopularReviews(id: movieId ?? 0)
    }
}

extension MoviePopularDetailViewController: MoviePopularDetailDisplayLogic {
    func displayPopularDetail(detail: MoviePopularDetailViewModel.ViewModel.Detail) {
        populars.onNext(detail)
        populars.onCompleted()
    }
    
    func displayPopularReviews(reviewList: [MoviePopularDetailViewModel.ViewModel.Reviews]) {
        reviews = reviewList
    }
}
