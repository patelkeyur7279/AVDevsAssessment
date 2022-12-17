//
//  APIRouters.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import Foundation
import Alamofire

enum APIRouters {
    case users(page: Int)
    
    var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .users:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .users(let page):
            return ["page": page]
        }
    }
}

extension APIRouters: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try BASE_URL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncoding.default.encode(request, with: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
