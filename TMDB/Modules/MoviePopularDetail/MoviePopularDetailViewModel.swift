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
        struct Movie {
            let popular: MovieListPopularEntity?
        }
        
    }

    struct ViewModel {
        struct Popular {
            let title: String
        }
    }
}