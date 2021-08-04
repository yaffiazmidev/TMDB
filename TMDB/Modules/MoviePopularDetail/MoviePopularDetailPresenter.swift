//
//  MoviePopularDetailPresenter.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation

protocol MoviePopularDetailPresentingLogic {
    func presentMoviePopularDetail(response: MoviePopularDetailViewModel.Response)
}

class MoviePopularDetailPresenter: MoviePopularDetailPresentingLogic {
    
    weak var view: MoviePopularDetailDisplayLogic?
    
    func presentMoviePopularDetail(response: MoviePopularDetailViewModel.Response) {
        if let detail = response.popularDetail {
            view?.displayPopularDetail(
                detail: MoviePopularDetailViewModel.ViewModel(
                    title: detail.title ?? "",
                    overview: detail.overview ?? "",
                    posterPath: detail.posterPath ?? "",
                    backdropPath: detail.backdropPath ?? "",
                    duration: detail.runtime ?? 0,
                    releaseDate: detail.releaseDate ?? "",
                    rating: detail.voteAverage ?? 0.0
                )
            )
        }
    }
}
