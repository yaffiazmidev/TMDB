//
//  MoviePopularDetailViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit
import RxSwift

protocol MoviePopularDetailDisplayLogic: AnyObject {
    func displayPopularDetail(detail: MoviePopularDetailViewModel.ViewModel)
}

class MoviePopularDetailViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var interactor: MoviePopularDetailInteractorBusinessLogic?
    var router: MoviePopularDetailRoutingLogic?
    private var bag = DisposeBag()
    
    var movieId: Int?
    var popular = PublishSubject<MoviePopularDetailViewModel.ViewModel>()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindComponent()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        MoviePopularDetailRouter.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindComponent() {
        popular.subscribe(onNext: { [weak self] popular in
            self?.title = popular.title
        }).disposed(by: bag)
        
        interactor?.fetchPopularDetail(id: movieId ?? 0)
    }
}

extension MoviePopularDetailViewController: MoviePopularDetailDisplayLogic {
    func displayPopularDetail(detail: MoviePopularDetailViewModel.ViewModel) {
        popular.onNext(detail)
        popular.onCompleted()
    }
}
