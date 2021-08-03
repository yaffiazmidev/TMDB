//
//  MovieListWorker.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import Foundation
import RxSwift

protocol MovieListWorkerDelegate {
    func getMoviePopular(_ page: Int) -> Observable<MovieListPopularEntity>
}

class MovieListWorker: MovieListWorkerDelegate {
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
