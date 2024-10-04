//
//  ApiClient.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire

class ApiClient: BaseApi {
    
   static func getProducts(completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
       request(urlConvertible: ApiRouter.getProducts, completion: completion)
   }
   static func getProductDetails(for id: Int, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
       request(urlConvertible: ApiRouter.getProductDetails(id: id), completion: completion)
   }
   static func createProduct(for data: ProductModel, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
       request(urlConvertible: ApiRouter.createProduct(data: data), completion: completion)
   }
    static func updateProduct(for id: Int,for data: ProductModel, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        request(urlConvertible: ApiRouter.updateProduct(id: id, data: data), completion: completion)
        
    }
    static func deleteProduct(for id: Int, completion: @escaping (Result<[ProductModel], ApiError>) -> Void) {
        request(urlConvertible: ApiRouter.deleteProduct(id: id), completion: completion)
        
    }
    
    static func getUsers(completion: @escaping (Result<[UserModel], ApiError>) -> Void)  {
        request(urlConvertible: ApiRouter.getUsers, completion: completion)
    }
    
    

}
