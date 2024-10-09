//
//  ApiRouter.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire

// Define the enum for Store API endpoints
enum ApiRouter: URLRequestConvertible {
    case getProducts
    case getUsers
    case getProductDetails(id: Int)
    case createProduct(data: ProductModel)
    case updateProduct(id: Int, data: ProductModel)
    case deleteProduct(id: Int)
    
    
    
    // Define the HTTP method for each case
    private var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        case .getUsers:
            return .get
        case .getProductDetails:
            return .get
        case .createProduct:
            return .post
        case .updateProduct:
            return .put
        case .deleteProduct:
            return .delete
        }
    }
    
    // Define the API path for each case
    private var path: String {
        switch self {
        case .getProducts:
            return "products"
        case .getUsers:
            return "users"
        case .getProductDetails(let id):
            return "products/\(id)"
        case .createProduct:
            return "products"
        case .updateProduct(let id, _):
            return "products/\(id)"
        case .deleteProduct(let id):
            return "products/\(id)"
        }
    }
    
    // MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let baseURL = URL(string: ApiConstants.BASE_URL)!
        let url = baseURL.appendingPathComponent(path)
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        print(urlRequest.httpMethod)
        print(urlRequest)
        
        
        // Set parameters
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return JSONEncoding.default
            case .post:
                return JSONEncoding.default
            case .delete:
                return URLEncoding.default
            case .patch:
                return JSONEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
    // MARK: - Parameters
        private var parameters: Parameters? {
            switch self {
            case .createProduct(let data):
                return [
                    "title": data.title ?? "",
                    "price": data.price ?? "",
                    "description": data.description ?? "",
                    "image": data.image ?? "",
                    "category": data.category ?? ""
                ]
            case .updateProduct(_, let data):
                return [
                    "title": data.title ?? "",
                    "price": data.price ?? "",
                    "description": data.description ?? "",
                    "image": data.image ?? "",
                    "category": data.category ?? ""
                ]
            case .deleteProduct:
                return nil
            case .getProducts, .getProductDetails, .getUsers:
                return nil
            }
        }
    
}

