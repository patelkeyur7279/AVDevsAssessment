//
//  User.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import Foundation

struct User: Codable {
    
    var id: Int?
    var name: String?
    var email: String?
    var gender: UserGender?
    var status: UserStatus?
    
}

enum UserGender: String, Codable {
    case male
    case female
}

enum UserStatus: String, Codable {
    case active
    case inactive
}
