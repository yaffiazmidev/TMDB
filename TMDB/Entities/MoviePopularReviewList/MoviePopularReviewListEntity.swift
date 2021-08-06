//
//  MoviePopularReviewListEntity.swift
//
//  Created by Yaffi Azmi on 06/08/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MoviePopularReviewListEntity: Codable {

  enum CodingKeys: String, CodingKey {
    case totalPages = "total_pages"
    case id
    case totalResults = "total_results"
    case page
    case results
  }

  var totalPages: Int?
  var id: Int?
  var totalResults: Int?
  var page: Int?
  var results: [MoviePopularReviewListEntityResults]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    results = try container.decodeIfPresent([MoviePopularReviewListEntityResults].self, forKey: .results)
  }

}
