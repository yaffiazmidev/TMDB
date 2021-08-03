//
//  NetworkService.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import Foundation
import RxSwift
import Moya
import SwiftyJSON
import Alamofire

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? Bool()
    }
}

class NetworkService {
    
    static let shared = NetworkService()
    
    // MARK: Request with RxSwift
    func requets<T: Decodable>(_ endpoint: Enpoint) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            AF.request(endpoint.route(),
                       method: endpoint.method,
                       parameters: endpoint.parameters,
                       encoding: endpoint.encode,
                       headers: endpoint.headers)
                .responseData { response in
                    self.logW(endpoint, response)
                    switch response.result {
                    case .success(let data):
                        do {
                            let results = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(results)
                            observer.onCompleted()
                        } catch let error {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create {
                
            }
        }
    }
    
    func logW(_ endpoint: Enpoint, _ response: AFDataResponse<Data>) {
        let trace = """
        ------------------------------ [TRACER] ----------------------------------------
        STATUS     :   \(response.response?.statusCode ?? 0)
        PATH       :   \(endpoint.route())
        METHOD     :   \(endpoint.method.rawValue)
        ENCODING   :   \(endpoint.encode)
        ------------------------------ [PARAMETER] -------------------------------------
        \(String(describing: endpoint.parameters))
        ------------------------------ [HEADER] ----------------------------------------
        \(String(describing: endpoint.headers))
        ------------------------------ [BODY] ------------------------------------------
        \(JSON(response.data ?? JSON()))
        """
        print(trace)
    }
}



enum ErrorState: Int {
    case noInternet = -1009
    case notFound = 404
    case badRequest = 400
    case unAuthorized = 401
    case other
    
    var message: String {
        switch self {
        case .noInternet:
            return "No Internet Access"
        case .notFound:
            return "Not Found"
        case .badRequest:
            return "Bad Request"
        case .unAuthorized:
            return "Unauthorized"
        default:
            return "Ops, Something wrong, please try again."
        }
    }
}

struct TMDBError {
    var message: String?
    var statusCode: Int?
    var errorState: ErrorState = .other
    
    init(message: String? = nil, statusCode: Int? = nil, errorState: ErrorState = .other) {
        self.message = message
        self.statusCode = statusCode
        self.errorState = errorState
    }
}

