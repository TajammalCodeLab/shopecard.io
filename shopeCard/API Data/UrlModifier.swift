//
//  UrlModifier.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation

class UrlModifier {
    
    static func getSingleProductUrl(productId: String) -> String {
        return ApiConstants.BASE_URL + "\(productId)"
    }
    
    static func getAllProductsUrl() -> String {
        return ApiConstants.BASE_URL
    }
    
    static func getLimitedProducts(limit: Int) -> String {
        return ApiConstants.BASE_URL + "?limit=\(limit)"
    }
    
    static func getProductsByCategory(category: String) -> String {
        return ApiConstants.BASE_URL + "\(category)"
    }
    
    
}
