//
//  DataManager.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import Combine

class DataManager: DataManagerProtocol {
    
    func fetchProducts() -> AnyPublisher<[ProductModel], Error> {
            return ApiClient.fetchProducts()
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    
    
}
