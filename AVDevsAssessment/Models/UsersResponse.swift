//
//  UsersResponse.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import Foundation

struct UsersResponse: Codable {
    
    var meta: UserResponseMeta?
    var data: [User]?
    
}

struct UserResponseMeta: Codable {
    var pagination: Pagination?
}
