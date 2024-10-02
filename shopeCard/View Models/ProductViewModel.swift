//
//  ProductViewModel.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation

class ProductViewModel {
    var products: [ProductModel] = []
    var onProductsFetched: (() -> Void)?
    
    func fetchProducts() {
        NetworkResponse.share.fetchProducts { result in
            
            switch result {
                
            case .success(let products):
                self.onProductsFetched?()
                self.products = products
                print("----------------------:  \(self.products.isEmpty) ----------------------- \(self.products.count) ----------------------- \n")
                
            case .failure(let error):
                print( StringConstants.errorMessage + "\(error)")
                
            }
        }
    }
}
