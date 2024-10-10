//
//  ApiClient.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import Combine
import Alamofire

class ApiClient: BaseApi {
    
    static func fetchProducts() -> AnyPublisher<[ProductModel], Error> {
            return request(route: ApiRouter.getProducts)
        }
}
