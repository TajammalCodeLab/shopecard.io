//
//  DataManager.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import Combine

class DataManager: DataManagerProtocol {
    func addToCartProducts(productID: Int) -> AnyPublisher<[ProductModel], any Error> {
        return ApiClient.addToCartProducts(productId: productID)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchElectronicProducts() -> AnyPublisher<[ProductModel], any Error> {
        return ApiClient.fetchElectronicProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchJeweleryProducts() -> AnyPublisher<[ProductModel], any Error> {
        return ApiClient.fetchJeweleryProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchMansClothProducts() -> AnyPublisher<[ProductModel], any Error> {
        return ApiClient.fetchmensClothProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchWomanClothProducts() -> AnyPublisher<[ProductModel], any Error> {
        return ApiClient.fetchWomanClothProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func fetchProducts() -> AnyPublisher<[ProductModel], Error> {
        return ApiClient.fetchProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
