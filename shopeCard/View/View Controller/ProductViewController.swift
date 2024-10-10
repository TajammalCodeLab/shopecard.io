//
//  ProductViewController.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import UIKit
import Combine

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTable: UITableView!
    
    private var productVM = ProductViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindViewModel()
        productVM.fetchProducts()
    }
    
    private func setupTableView() {
        productTable.register(UINib(nibName: Identifiers.PRODUCT_XiB_NANME, bundle: nil), forCellReuseIdentifier: Identifiers.PRODUCT_CELL_ID)
    }
    
    private func bindViewModel() {
        productVM.$products
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.productTable.reloadData()
            }
            .store(in: &cancellables)
        
        productVM.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
            .store(in: &cancellables)
        
        productVM.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                if let errorMessage = errorMessage {
                    self?.showAlert(message: errorMessage)
                }
            }
            .store(in: &cancellables)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


// MARK: - UITableViewDataSource
extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(productVM.products.count)
        return productVM.products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Identifiers.CELL_HEIGHT_FOR_PRODUCTS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.PRODUCT_CELL_ID, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        let product = productVM.products[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected product
        let selectedProduct = productVM.products[indexPath.row]
        productVM.goToProductDetail(selectedProduct: selectedProduct, vc: self)
    }
}

