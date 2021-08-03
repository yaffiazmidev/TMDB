//
//  MoviePopularDetailInteractor.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation
import RxSwift

protocol MoviePopularDetailInteractorBusinessLogic {
    func fetchPopularDetail(id: Int)
}

class MoviePopularDetailInteractor: MoviePopularDetailInteractorBusinessLogic {
    
    var worker: MoviePopularDetailWorkerDelegate?
    var presenter: MoviePopularDetailPresentingLogic?
    private var bag = DisposeBag()
    
    func fetchPopularDetail(id: Int) {
        worker?.getPopularDetail(id).subscribe(onNext: { [weak self] response in
            self?.presenter?.presentMoviePopularDetail(response: MoviePopularDetailViewModel.Response(popularDetail: response))
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: bag)
    }
}
