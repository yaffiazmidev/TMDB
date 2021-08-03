//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import UIKit

struct MovieListViewModel {
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
            let id: Int
            let title: String
        }
    }
}
