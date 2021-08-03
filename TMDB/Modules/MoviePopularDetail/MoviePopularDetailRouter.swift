//
//  MoviePopularDetailRouter.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit

protocol MoviePopularDetailRoutingLogic {
    
}

class MoviePopularDetailRouter: MoviePopularDetailRoutingLogic {
    weak var parentController: MoviePopularDetailViewController?
    private var navigationController: UINavigationController? { parentController?.navigationController }
}

extension MoviePopularDetailRouter {
    static func configure(viewController: MoviePopularDetailViewController) {
        let worker: MoviePopularDetailWorker = MoviePopularDetailWorker()
        
        let presenter: MoviePopularDetailPresenter = MoviePopularDetailPresenter()
        presenter.view = viewController
        
        let router: MoviePopularDetailRouter = MoviePopularDetailRouter()
        router.parentController = viewController
        
        let interactor: MoviePopularDetailInteractor = MoviePopularDetailInteractor()
        interactor.presenter = presenter
        interactor.worker = worker
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
