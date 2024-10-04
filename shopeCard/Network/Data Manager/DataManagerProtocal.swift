//
//  DataManagerProtocal.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
protocol DataManagerProtocal {
    
    func getProducts(completion: @escaping (Result<[ProductModel], ApiError>) -> Void)
    func getUsers(completion: @escaping (Result<[UserModel], ApiError>) -> Void)
    func getProductDetails(id: Int, completion: @escaping (Result<[ProductModel], ApiError>) -> Void)
    func createProduct(data: ProductModel, completion: @escaping (Result<[ProductModel], ApiError>) -> Void)
    func updateProduct(id: Int, data: ProductModel, completion: @escaping (Result<[ProductModel], ApiError>) -> Void)
    func deleteProduct(id: Int, completion: @escaping (Result<[ProductModel], ApiError>) -> Void)
    
}
