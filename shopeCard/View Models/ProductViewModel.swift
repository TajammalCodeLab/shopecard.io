//
//  ProductViewModel.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Combine
import Foundation
import UIKit

class ProductViewModel: ObservableObject {

    let mDataManager: DataManager = DataManager()
    private var cancellables = Set<AnyCancellable>()

    @Published var products: [ProductModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func fetchProducts() {
        isLoading = true
        errorMessage = nil

        mDataManager.fetchProducts()
            .receive(on: DispatchQueue.global())
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                case .finished:
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] fetchedProducts in
                self?.products = fetchedProducts
            })
            .store(in: &cancellables)
    }

    func goToProductDetail(selectedProduct: ProductModel, vc: UIViewController) {
        if let VC = Identifiers.Storyboard.instantiateViewController(withIdentifier: "productDetail_ID") as? ProductDetailViewController {
            VC.selectedProduct = selectedProduct
            VC.modalPresentationStyle = .popover
            vc.present(VC, animated: true, completion: nil)
        }
    }
}
