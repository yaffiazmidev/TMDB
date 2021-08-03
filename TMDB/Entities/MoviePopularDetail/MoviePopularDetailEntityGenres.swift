//
//  MoviePopularDetailEntityGenres.swift
//
//  Created by Yaffi Azmi on 04/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MoviePopularDetailEntityGenres: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case id
  }

  var name: String?
  var id: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
