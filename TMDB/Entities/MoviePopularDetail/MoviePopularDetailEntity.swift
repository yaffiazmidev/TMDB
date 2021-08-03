//
//  MoviePopularDetailEntity.swift
//
//  Created by Yaffi Azmi on 04/08/21
//  Copyright (c) TMDB. All rights reserved.
//

import Foundation

struct MoviePopularDetailEntity: Codable {

  enum CodingKeys: String, CodingKey {
    case video
    case homepage
    case adult
    case spokenLanguages = "spoken_languages"
    case productionCountries = "production_countries"
    case id
    case imdbId = "imdb_id"
    case backdropPath = "backdrop_path"
    case runtime
    case originalTitle = "original_title"
    case genres
    case voteAverage = "vote_average"
    case originalLanguage = "original_language"
    case releaseDate = "release_date"
    case popularity
    case tagline
    case overview
    case productionCompanies = "production_companies"
    case belongsToCollection = "belongs_to_collection"
    case status
    case budget
    case revenue
    case posterPath = "poster_path"
    case voteCount = "vote_count"
    case title
  }

  var video: Bool?
  var homepage: String?
  var adult: Bool?
  var spokenLanguages: [MoviePopularDetailEntitySpokenLanguages]?
  var productionCountries: [MoviePopularDetailEntityProductionCountries]?
  var id: Int?
  var imdbId: String?
  var backdropPath: String?
  var runtime: Int?
  var originalTitle: String?
  var genres: [MoviePopularDetailEntityGenres]?
  var voteAverage: Float?
  var originalLanguage: String?
  var releaseDate: String?
  var popularity: Float?
  var tagline: String?
  var overview: String?
  var productionCompanies: [MoviePopularDetailEntityProductionCompanies]?
  var belongsToCollection: MoviePopularDetailEntityBelongsToCollection?
  var status: String?
  var budget: Int?
  var revenue: Int?
  var posterPath: String?
  var voteCount: Int?
  var title: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    spokenLanguages = try container.decodeIfPresent([MoviePopularDetailEntitySpokenLanguages].self, forKey: .spokenLanguages)
    productionCountries = try container.decodeIfPresent([MoviePopularDetailEntityProductionCountries].self, forKey: .productionCountries)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    genres = try container.decodeIfPresent([MoviePopularDetailEntityGenres].self, forKey: .genres)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    productionCompanies = try container.decodeIfPresent([MoviePopularDetailEntityProductionCompanies].self, forKey: .productionCompanies)
    belongsToCollection = try container.decodeIfPresent(MoviePopularDetailEntityBelongsToCollection.self, forKey: .belongsToCollection)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    budget = try container.decodeIfPresent(Int.self, forKey: .budget)
    revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    title = try container.decodeIfPresent(String.self, forKey: .title)
  }

}
