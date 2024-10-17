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
    static func fetchElectronicProducts() -> AnyPublisher<[ProductModel], Error> {
        return request(route: ApiRouter.electronics)
    }
    static func fetchJeweleryProducts() -> AnyPublisher<[ProductModel], Error> {
        return request(route: ApiRouter.jewelery)
    }
    static func fetchmensClothProducts() -> AnyPublisher<[ProductModel], Error> {
        return request(route: ApiRouter.mensCloth)
    }
    static func fetchWomanClothProducts() -> AnyPublisher<[ProductModel], Error> {
        return request(route: ApiRouter.womanCloth)
    }
    static func addToCartProducts(productId: Int) -> AnyPublisher<[ProductModel], Error> {
        return request(route: ApiRouter.addToCart(productId: productId))
    }
}
