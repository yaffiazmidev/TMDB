//
//  MoviePopularDetailWorker.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation
import RxSwift

protocol MoviePopularDetailWorkerDelegate {
    func getMoviePopular(_ page: Int) -> Observable<MovieListPopularEntity>
}

class MoviePopularDetailWorker: MoviePopularDetailWorkerDelegate {
    private let service = NetworkService.shared
    
    func getMoviePopular(_ page: Int) -> Observable<MovieListPopularEntity> {
        let enpoint = Enpoint()
        enpoint.path = "/movie/popular"
        enpoint.parameters = [
            "page": page,
            "per_page": 10
        ]
        return service.requets(enpoint)
    }
}
