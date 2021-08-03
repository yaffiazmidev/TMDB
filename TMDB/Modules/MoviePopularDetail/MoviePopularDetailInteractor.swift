//
//  MoviePopularDetailInteractor.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation
import RxSwift

protocol MoviePopularDetailInteractorBusinessLogic {
    func fetchMovieListPopular(page: Int)
}

class MoviePopularDetailInteractor: MoviePopularDetailInteractorBusinessLogic {
    
    var worker: MovieListWorkerDelegate?
    var presenter: MovieListPresentingLogic?
    private var bag = DisposeBag()
    
    func fetchMovieListPopular(page: Int) {
        worker?.getMoviePopular(page).subscribe(onNext: { [weak self] response in
            self?.presenter?.presentMovieListPopular(response: MovieListViewModel.Response.Movie(popular: response))
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: bag)
    }
}
