//
//  MoviePopularDetailPresenter.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import Foundation

protocol MoviePopularDetailPrsentingLogic {
    func presentMovieListPopular(response: MovieListViewModel.Response.Movie)
}

class MoviePopularDetailPresenter: MoviePopularDetailPrsentingLogic {
    
    weak var view: MovieListDisplayLogic?
    
    func presentMovieListPopular(response: MovieListViewModel.Response.Movie) {
        
        var popularList: [MovieListViewModel.ViewModel.Popular] = []
        
        response.popular?.results?.forEach({ popular in
            let _popular = MovieListViewModel.ViewModel.Popular(title: popular.title ?? "")
            popularList.append(_popular)
        })
        
        view?.displayMovieListPopular(popularList: popularList)
    }
}
