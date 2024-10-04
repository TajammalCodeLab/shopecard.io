//
//  ProductViewModel.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import UIKit

class ProductViewModel {
    var products: [ProductModel] = []
    var productDetail: [ProductModel] = []
    
    var onProductsFetched: (() -> Void)?
    
    func fetchProducts() {
        DataManager.shared.getProducts { (result:Result<[ProductModel], ApiError>) in
            
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
    
    func goToProductDetail(selectedProduct: ProductModel, vc: UIViewController) {
        
        
        if let VC = Identifiers.Storyboard.instantiateViewController(withIdentifier: "productDetail_ID") as? ProductDetailViewController {
            VC.selectedProduct = selectedProduct
            VC.modalPresentationStyle = .popover
            vc.present(VC, animated: true, completion: nil)
        }
    }
}
