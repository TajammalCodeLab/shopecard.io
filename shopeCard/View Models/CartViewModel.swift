//
//  CartViewModel.swift
//  shopeCard
//
//  Created by SID on 04/10/2024.
//

import Foundation
import Combine
class CartViewModel:ObservableObject {
    let mDataManager: DataManager = DataManager()
    private var cancellables = Set<AnyCancellable>()
    
    // Published properties to trigger UI updates
    @Published var cartProducts: [ProductModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var totalCartPrice: Double = 0.0
    
    // Function to add a product to the cart
    func addToCart(productId: Int) {
        isLoading = true
        errorMessage = nil
        
        mDataManager.addToCartProducts(productID: productId)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                case .finished:
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] products in
                // Update the cart products
                self?.cartProducts = products
                self?.calculateTotalCartPrice() // Update total price
            })
            .store(in: &cancellables)
    }
    
    // Function to calculate the total price of all products in the cart
    private func calculateTotalCartPrice() {
        totalCartPrice = cartProducts.reduce(0) { $0 + ($1.price ?? 0) }
    }
    
    
    
}
