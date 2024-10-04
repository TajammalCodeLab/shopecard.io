//
//  DataManager.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation

class DataManager: NSObject, DataManagerProtocal {
    func getProducts(completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        ApiClient.getProducts(completion: completion)
    }
    
    func getProductDetails(id: Int, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        ApiClient.getProductDetails(for: id, completion: completion)
    }
    
    func createProduct(data: ProductModel, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        ApiClient.createProduct(for: data, completion: completion)
    }
    
    func updateProduct(id: Int, data: ProductModel, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        ApiClient.updateProduct(for: id, for: data, completion: completion)
    }
    
    func deleteProduct(id: Int, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        ApiClient.deleteProduct(for: id, completion: completion)
    }
    func getUsers(completion: @escaping (Result<[UserModel], ApiError>) -> Void){
        ApiClient.getUsers(completion: completion)
    }
    
    
    static let shared = DataManager()
}
