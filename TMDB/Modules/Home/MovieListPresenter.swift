//
//  MovieListPresenter.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import Foundation

protocol MovieListPresentingLogic {
    func presentMovieListPopular(response: MovieListViewModel.Response.Movie)
}

class MovieListPresenter: MovieListPresentingLogic {
    
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
