//
//  NetworkResponse.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire

class NetworkResponse {
    static let share = NetworkResponse()
    
    
    func fetchProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        let url = UrlModifier.getAllProductsUrl()

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: [ProductModel].self) { response in
                switch response.result {
                case .success(let products):
                    completion(.success(products))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
