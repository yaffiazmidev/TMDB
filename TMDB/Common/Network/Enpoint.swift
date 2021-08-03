//
//  Client.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import Moya
import Alamofire

//enum Client {
//    case popular
//    case detail(id: String)
//}
//
//extension Client: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else { fatalError() }
        return url
    }
//
//    var path: String {
//        let apiKey = "524c1cb44f3108915ee3dd519f3e45bd"
//        switch self {
//        case .popular:
//            return "movie/popular?api_key=\(apiKey)"
//        case .detail(let id):
//            return "movie/" + "\(id)/" + apiKey
//        }
//    }
//
//    var method: Method {
//        switch self {
//        case .popular, .detail:
//            return .get
//        }
//    }
//
//    var sampleData: Data {
//        return Data()
//    }
//
//    var task: Task {
//        switch self {
//        case .popular:
//            return .requestParameters(parameters: ["api_key": "524c1cb44f3108915ee3dd519f3e45bd"], encoding: URLEncoding.queryString)
//        case .detail:
//            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
//        }
//    }
//
//    var headers: [String : String]? {
//        return nil
//    }
//}

class Enpoint {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3") else { fatalError() }
        return url
    }
    
    var apiKey: String {
        return "?api_key=524c1cb44f3108915ee3dd519f3e45bd"
    }
    
    var path: String = ""
    var method: HTTPMethod = .get
    var headers: HTTPHeaders = [:]
    var parameters: Parameters = [:]
    var encode: ParameterEncoding = URLEncoding.queryString
    
    func route() -> String {
        return "\(baseURL)\(path)\(apiKey)"
    }    
}
