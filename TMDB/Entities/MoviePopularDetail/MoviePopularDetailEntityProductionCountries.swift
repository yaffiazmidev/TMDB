//
//  MoviePopularDetailEntityProductionCountries.swift
//
//  Created by Yaffi Azmi on 04/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MoviePopularDetailEntityProductionCountries: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case iso31661 = "iso_3166_1"
  }

  var name: String?
  var iso31661: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    iso31661 = try container.decodeIfPresent(String.self, forKey: .iso31661)
  }

}
