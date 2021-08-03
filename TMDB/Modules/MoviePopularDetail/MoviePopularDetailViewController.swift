//
//  MoviePopularDetailViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit

class MoviePopularDetailViewController: UIViewController {
    
    var interactor: MoviePopularDetailInteractorBusinessLogic?
    var router: MoviePopularDetailRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        MoviePopularDetailRouter.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
