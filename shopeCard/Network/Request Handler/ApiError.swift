//
//  ApiError.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
struct ApiError: Error, Codable {
    let message: String
    let statusCode: Int
    
    init(message: String, statusCode: Int) {
        self.message = message
        self.statusCode = statusCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.message = try container.decode(String.self)
        self.statusCode = 0
    }
}
