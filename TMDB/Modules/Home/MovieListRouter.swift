//
//  MovieListRouter.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import UIKit

protocol MovieListRoutingLogic {
    func navigateToPopularDetail(_ movieId: Int)
}

class MovieListRouter: MovieListRoutingLogic {
    weak var parentController: MovieListViewController?
    private var navigationController: UINavigationController? { parentController?.navigationController }
    
    func navigateToPopularDetail(_ movieId: Int) {
        let vc = MoviePopularDetailViewController()
        vc.movieId = movieId
        vc.modalPresentationStyle = .overFullScreen
        parentController?.present(vc, animated: true, completion: nil)
    }
}

extension MovieListRouter {
    static func configure(viewController: MovieListViewController) {
        let worker: MovieListWorker = MovieListWorker()
        
        let presenter: MovieListPresenter = MovieListPresenter()
        presenter.view = viewController
        
        let router: MovieListRouter = MovieListRouter()
        router.parentController = viewController
        
        let interactor: MovieListInteractor = MovieListInteractor()
        interactor.presenter = presenter
        interactor.worker = worker
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
