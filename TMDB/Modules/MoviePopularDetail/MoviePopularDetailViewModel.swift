//
//  MoviePopularDetailViewModel.swift
//  TMDB
//
//  Created by Yaffi Azmi on 04/08/21.
//

import UIKit

struct MoviePopularDetailViewModel {
    struct Request {
        // do someting...

        var parameters: [String: Any]? {
            // do someting...
            return nil
        }
    }

    struct Response {
        let popularDetail: MoviePopularDetailEntity?
        let popularReviews: MoviePopularReviewListEntity?
    }

    struct ViewModel {
        struct Detail {
            let title: String
            let overview: String
            let posterPath: String
            let backdropPath: String
            let duration: Int
            let releaseDate: String
            let rating: Float
        }
        
        struct Reviews {
            let name: String
            let username: String
            let avatarPath: String
            let rating: Int
            let content: String
        }
    }
}
