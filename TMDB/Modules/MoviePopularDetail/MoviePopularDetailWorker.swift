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
    func getPopularReviews(_ id: Int) -> Observable<MoviePopularReviewListEntity>
}

class MoviePopularDetailWorker: MoviePopularDetailWorkerDelegate {
    private let service = NetworkService.shared
    
    func getPopularDetail(_ id: Int) -> Observable<MoviePopularDetailEntity> {
        let enpoint = Enpoint()
        enpoint.path = "/movie/\(id)"
        return service.requets(enpoint)
    }
    
    func getPopularReviews(_ id: Int) -> Observable<MoviePopularReviewListEntity> {
        let enpoint = Enpoint()
        enpoint.path = "/movie/\(id)/reviews"
        return service.requets(enpoint)
    }
}
