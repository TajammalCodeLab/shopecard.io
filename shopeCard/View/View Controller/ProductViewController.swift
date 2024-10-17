//
//  ProductViewController.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import UIKit
import Combine

class ProductViewController: UIViewController {
    
    @IBOutlet weak var filterBar: UISegmentedControl!
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
        return UITableView.automaticDimension
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

// MARK: - Data Binding
/// The bindViewModel() function in the ProductViewController connects the ViewModel's data to the UI, ensuring the interface reacts to changes in the ProductViewModel (like reloading the table view, showing a loading spinner, or displaying error messages).

/// In the ProductViewModel, .receive(on: DispatchQueue.main) and .sink() ensure data changes happen on the main thread but don't update the UI directly. In the ProductViewController, .sink() listens to these changes and updates the UI. Both are necessary: the ViewModel handles data, while the ViewController manages the UI updates.


extension ProductViewController {
    
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
}

// MARK: Filter Implementation

extension ProductViewController {
    
    func getSelectedTitle() -> String {
        let index = filterBar.selectedSegmentIndex
        let title = filterBar.titleForSegment(at: index) ?? ""
        return title
        
    }
    
    func updateFilterView() {
        
        let title = getSelectedTitle()
        
        if title == "Jewelery" {
            productVM.fetchJewelaryProducts()
        } else if title == "Electronics" {
            productVM.fetchElectronicProducts()
        }else if title == "Men's" {
            productVM.fetchMensProducts()
        }else if title == "Women's" {
            productVM.fetchWomensProducts()
        }
        else if title == "Home" {
            productVM.fetchProducts()
        }
    }
    
    @IBAction func filterBtn(_ sender: UISegmentedControl) {
        updateFilterView()
    }
    
}
