//
//  DataManagerProtocol.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import Combine

protocol DataManagerProtocol {
    func fetchProducts () -> AnyPublisher<[ProductModel], Error>
    func fetchElectronicProducts () -> AnyPublisher<[ProductModel], Error>
    func fetchJeweleryProducts () -> AnyPublisher<[ProductModel], Error>
    func fetchMansClothProducts () -> AnyPublisher<[ProductModel], Error>
    func fetchWomanClothProducts () -> AnyPublisher<[ProductModel], Error>
    func addToCartProducts (productID: Int) -> AnyPublisher<[ProductModel], Error>
}
