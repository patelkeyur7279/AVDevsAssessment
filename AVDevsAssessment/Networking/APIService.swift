//
//  APIService.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.waitsForConnectivity = true
        return Session(configuration: configuration)
    }()
    
}
