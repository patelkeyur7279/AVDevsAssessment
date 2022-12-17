//
//  Pagination.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import Foundation

struct Pagination: Codable {
    
    var total: Int?
    var pages: Int?
    var page: Int?
    var limit: Int?
    var links: PaginationLinks?
    
}

struct PaginationLinks: Codable {
    
    var previous: String?
    var current: String?
    var next: String?
    
}
