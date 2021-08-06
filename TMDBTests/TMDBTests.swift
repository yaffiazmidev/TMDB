//
//  TMDBTests.swift
//  TMDBTests
//
//  Created by Yaffi Azmi on 06/08/21.
//

import XCTest
import Quick
import Nimble
import RxSwift
@testable import TMDB

// MARK MovieList Unit Testing

class MovieListControllerMock: MovieListDisplayLogic {
    var router: MovieListRoutingLogic?
    var isDidSuccessGetList = false
    
    func displayMovieListPopular(popularList: [MovieListViewModel.ViewModel.Popular]) {
        isDidSuccessGetList = true
    }
}

class MovieListInteractorMock: MovieListInteractorBusinessLogic {
    var isGetMoviePopularList = false
    func fetchMovieListPopular(page: Int) {
        isGetMoviePopularList = true
    }
}

class MovieListPresenterMock : MovieListPresentingLogic {
    var isPresentSuccessGetList = false
    func presentMovieListPopular(response: MovieListViewModel.Response.Movie) {
        isPresentSuccessGetList = true
    }
}

class MovieListWorkerMock: MovieListWorkerDelegate {
    var isGetMoviePopularList = false
    func getMoviePopular(_ page: Int) -> Observable<MovieListPopularEntity> {
        isGetMoviePopularList = true
    }
}

class TopListRouterMock: MovieListRoutingLogic {
    var isNavigateToDetail = false
    func navigateToPopularDetail(_ movieId: Int) {
        isNavigateToDetail = true
    }
}


class TopListTests: QuickSpec {
    override func spec() {
        describe("MovieListInteractor") {
            var sut: MovieListInteractor!
            var presenter: MovieListPresenterMock!
            var worker: MovieListWorkerMock!
            
            beforeEach {
                presenter = MovieListPresenterMock()
                worker = MovieListWorkerMock()
                let interactor = MovieListInteractor()
                interactor.presenter = presenter
                interactor.worker = worker
                sut = interactor
            }
            
            context("getMovieList called") {
                it("When getMovieList is called, all the functions is called in getMovieList must be called succesfully") {
                    sut.fetchMovieListPopular(page: 1)
                    expect(worker.isGetMoviePopularList).to(beTrue())
                }
            }
        }
        
        describe("MovieListPresenter") {
            var sut: MovieListPresenter!
            var view: MovieListControllerMock!

            beforeEach {
                view = MovieListControllerMock()
                sut = MovieListPresenter()
            }
        }

        describe("TopListRouter") {
            var sut: MovieListRouter!
            var view: MovieListViewController!

            beforeEach {
                view = MovieListViewController()
                sut = MovieListRouter()
            }

            context("navigateToNews called") {
                it("when navigateToNews function is called ") {
                    sut.navigateToPopularDetail(1)
                }
            }
        }

        describe("MovieListWorker") {
            context("MovieData") {
                it("when data is checking") {
                }
            }

        }
    }
}

