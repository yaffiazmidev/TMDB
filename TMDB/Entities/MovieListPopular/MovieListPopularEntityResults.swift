//
//  MovieListPopularEntityResults.swift
//
//  Created by Yaffi Azmi on 03/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MovieListPopularEntityResults: Codable {

  enum CodingKeys: String, CodingKey {
    case adult
    case overview
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case title
    case originalTitle = "original_title"
    case backdropPath = "backdrop_path"
    case popularity
    case video
    case originalLanguage = "original_language"
    case releaseDate = "release_date"
    case posterPath = "poster_path"
    case id
    case genreIds = "genre_ids"
  }

  var adult: Bool?
  var overview: String?
  var voteAverage: Float?
  var voteCount: Int?
  var title: String?
  var originalTitle: String?
  var backdropPath: String?
  var popularity: Float?
  var video: Bool?
  var originalLanguage: String?
  var releaseDate: String?
  var posterPath: String?
  var id: Int?
  var genreIds: [Int]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
  }

}
