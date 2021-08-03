//
//  MoviePopularDetailEntitySpokenLanguages.swift
//
//  Created by Yaffi Azmi on 04/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MoviePopularDetailEntitySpokenLanguages: Codable {

  enum CodingKeys: String, CodingKey {
    case iso6391 = "iso_639_1"
    case name
    case englishName = "english_name"
  }

  var iso6391: String?
  var name: String?
  var englishName: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    englishName = try container.decodeIfPresent(String.self, forKey: .englishName)
  }

}
