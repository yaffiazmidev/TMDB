//
//  MoviePopularDetailWorker.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation
import RxSwift

protocol MoviePopularDetailWorkerDelegate {
    func getPopularDetail(_ id: Int) -> Observable<MoviePopularDetailEntity>
}

class MoviePopularDetailWorker: MoviePopularDetailWorkerDelegate {
    private let service = NetworkService.shared
    
    func getPopularDetail(_ id: Int) -> Observable<MoviePopularDetailEntity> {
        let enpoint = Enpoint()
        enpoint.path = "/movie/\(id)"
        return service.requets(enpoint)
    }
}
