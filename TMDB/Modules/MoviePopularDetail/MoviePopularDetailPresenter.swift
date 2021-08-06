//
//  MoviePopularDetailPresenter.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation

protocol MoviePopularDetailPresentingLogic {
    func presentMoviePopularDetail(response: MoviePopularDetailViewModel.Response)
    func presentMoviePopularReviews(response: MoviePopularDetailViewModel.Response)
}

class MoviePopularDetailPresenter: MoviePopularDetailPresentingLogic {
    weak var view: MoviePopularDetailDisplayLogic?
    
    func presentMoviePopularDetail(response: MoviePopularDetailViewModel.Response) {
        if let detail = response.popularDetail {
            view?.displayPopularDetail(
                detail: MoviePopularDetailViewModel.ViewModel.Detail(
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
    
    func presentMoviePopularReviews(response: MoviePopularDetailViewModel.Response) {
        
        var popularReviewList: [MoviePopularDetailViewModel.ViewModel.Reviews] = []
        
        response.popularReviews?.results?.forEach({ review in
            let _review = MoviePopularDetailViewModel.ViewModel.Reviews(name: review.authorDetails?.name ?? "",
                                                                         username: review.authorDetails?.username ?? "",
                                                                         avatarPath: review.authorDetails?.avatarPath ??  "",
                                                                         rating: review.authorDetails?.rating ?? 0,
                                                                         content: review.content ?? "")
            popularReviewList.append(_review)
        })
        
        view?.displayPopularReviews(reviewList: popularReviewList)
    }
}
