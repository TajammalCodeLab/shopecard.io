//
//  ProductViewModel.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import UIKit
import RxSwift

class ProductViewModel: ObservableObject {
    
    let mDataManager:DataManager = DataManager()
    private let disposeBag = DisposeBag()
    
    var products: Box<[ProductModel]> = Box([])
    // Using Box for loading state
    var isLoading: Box<Bool> = Box(false)
    // Using Box for error messages
    var errorMessage: Box<String?> = Box(nil)
    
    
    func fetchProducts() {
        isLoading.value = true
        errorMessage.value = nil
        
        mDataManager.fetchProducts()
            .subscribe(onNext: { [weak self] fetchedProducts in
                print("++++++1++++++++++ \(fetchedProducts)")
                self?.products.value = fetchedProducts
                print("++++++2++++++++++  \(self?.products)")
                self?.isLoading.value = false
            }, onError: { [weak self] error in
                self?.errorMessage.value = error.localizedDescription
                self?.isLoading.value = false
            })
            .disposed(by: disposeBag)
    }
    
    
    
    func goToProductDetail(selectedProduct: ProductModel, vc: UIViewController) {
        
        
        if let VC = Identifiers.Storyboard.instantiateViewController(withIdentifier: "productDetail_ID") as? ProductDetailViewController {
            VC.selectedProduct = selectedProduct
            VC.modalPresentationStyle = .popover
            vc.present(VC, animated: true, completion: nil)
        }
    }
}
