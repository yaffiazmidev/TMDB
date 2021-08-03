//
//  MoviePopularDetailEntityProductionCompanies.swift
//
//  Created by Yaffi Azmi on 04/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MoviePopularDetailEntityProductionCompanies: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case logoPath = "logo_path"
    case name
    case originCountry = "origin_country"
  }

  var id: Int?
  var logoPath: String?
  var name: String?
  var originCountry: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
  }

}
