//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import UIKit
import RxSwift
import RxCocoa

protocol MovieListDisplayLogic: AnyObject {
    func displayMovieListPopular(popularList: [MovieListViewModel.ViewModel.Popular])
}

class MovieListViewController: UIViewController {
    
    var interactor: MovieListInteractorBusinessLogic?
    var router: MovieListRoutingLogic?
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private var bag = DisposeBag()
    var populars = PublishSubject<[MovieListViewModel.ViewModel.Popular]>()

    override func viewDidLoad() {
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        bindTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        MovieListRouter.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindTableView() {
        // Bind items to table
        populars.bind(
            to: tableView.rx.items(cellIdentifier: "cell",
                                   cellType: UITableViewCell.self)
        ) { row, item, cell in
            cell.textLabel?.text = item.title
        }.disposed(by: bag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(MovieListViewModel.ViewModel.Popular.self).bind { [weak self] popular in
            print(popular.title)
            let vc = MoviePopularDetailViewController()
            vc.movieId = popular.id
            self?.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: bag)
        
        // Fetch items
        interactor?.fetchMovieListPopular(page: 1)
        
    }
}

extension MovieListViewController: MovieListDisplayLogic {
    func displayMovieListPopular(popularList: [MovieListViewModel.ViewModel.Popular]) {
        populars.onNext(popularList)
        populars.onCompleted()
    }
}
