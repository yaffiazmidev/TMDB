//
//  MovieListInteractor.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import Foundation
import RxSwift

protocol MovieListInteractorBusinessLogic {
    func fetchMovieListPopular(page: Int)
}

class MovieListInteractor: MovieListInteractorBusinessLogic {
    
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
