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
    case electronics
    case jewelery
    case mensCloth
    case womanCloth
    case addToCart(productId: Int)
    
    
    
    // Define the HTTP method for each case
    private var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        case .electronics:
            return .get
        case .jewelery:
            return .get
        case .mensCloth:
            return .get
        case .womanCloth:
            return .get
        case .addToCart:
            return .get
        }
    }
    
    
    // Define the API path for each case
    private var path: String {
        switch self {
        case .getProducts:
            return "products"
        case .electronics:
            return "products/category/electronics"
        case .addToCart(let productID):
            return "products/\(productID)"
        case .jewelery:
            return "products/category/jewelery"
        case .mensCloth:
            return "products/category/men's clothing"
        case .womanCloth:
            return "products/category/women's clothing"
        }
    }
    
    // MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let baseURL = URL(string: ApiConstants.BASE_URL)!
        let url = baseURL.appendingPathComponent(path)
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
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
            case .getProducts, .electronics, .jewelery, .mensCloth, .womanCloth:
                return nil
            case .addToCart:
                return nil
            }
        }
    
}

