//
//  MoviePopularReviewListEntityAuthorDetails.swift
//
//  Created by Yaffi Azmi on 06/08/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MoviePopularReviewListEntityAuthorDetails: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case rating
    case username
    case avatarPath = "avatar_path"
  }

  var name: String?
  var rating: Int?
  var username: String?
  var avatarPath: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    rating = try container.decodeIfPresent(Int.self, forKey: .rating)
    username = try container.decodeIfPresent(String.self, forKey: .username)
    avatarPath = try container.decodeIfPresent(String.self, forKey: .avatarPath)
  }

}
