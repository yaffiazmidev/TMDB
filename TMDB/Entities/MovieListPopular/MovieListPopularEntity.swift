//
//  MovieListPopularEntity.swift
//
//  Created by Yaffi Azmi on 03/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MovieListPopularEntity: Codable {

  enum CodingKeys: String, CodingKey {
    case results
    case totalResults = "total_results"
    case totalPages = "total_pages"
    case page
  }

  var results: [MovieListPopularEntityResults]?
  var totalResults: Int?
  var totalPages: Int?
  var page: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    results = try container.decodeIfPresent([MovieListPopularEntityResults].self, forKey: .results)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
  }

}
