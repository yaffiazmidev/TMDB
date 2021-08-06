//
//  MoviePopularReviewListEntityResults.swift
//
//  Created by Yaffi Azmi on 06/08/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MoviePopularReviewListEntityResults: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case url
    case author
    case authorDetails = "author_details"
    case content
  }

  var id: String?
  var createdAt: String?
  var updatedAt: String?
  var url: String?
  var author: String?
  var authorDetails: MoviePopularReviewListEntityAuthorDetails?
  var content: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    author = try container.decodeIfPresent(String.self, forKey: .author)
    authorDetails = try container.decodeIfPresent(MoviePopularReviewListEntityAuthorDetails.self, forKey: .authorDetails)
    content = try container.decodeIfPresent(String.self, forKey: .content)
  }

}
