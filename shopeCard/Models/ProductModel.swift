//
//  ProductModel.swift
//  shopeCard
//
//  Created by SID on 01/10/2024.
//

import Foundation


struct ProductModel {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: Category?
    let image: String?
    let rating: Rating?
}

enum Category: String {
    case electronics
    case jewelery
    case menSClothing
    case womenSClothing
}

// MARK: - Rating
struct Rating {
    let rate: Double?
    let count: Int?
}
