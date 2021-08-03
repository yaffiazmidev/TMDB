//
//  MoviePopularDetailEntityBelongsToCollection.swift
//
//  Created by Yaffi Azmi on 04/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MoviePopularDetailEntityBelongsToCollection: Codable {

  enum CodingKeys: String, CodingKey {
    case backdropPath = "backdrop_path"
    case id
    case posterPath = "poster_path"
    case name
  }

  var backdropPath: String?
  var id: Int?
  var posterPath: String?
  var name: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}
