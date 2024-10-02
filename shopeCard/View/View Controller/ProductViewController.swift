//
//  ProductViewController.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTable: UITableView!
    private var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        productTable.register(UINib(nibName: Identifiers.XiB_NANME, bundle: nil), forCellReuseIdentifier: Identifiers.CELL_ID)
    }
    
    
    private func bindViewModel() {
        productViewModel.fetchProducts()
        productViewModel.onProductsFetched = { [weak self] in
            self?.reloadTableView()
        }
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.productTable.reloadData()
        }
    }
    
    
    
}

// MARK: - UITableViewDataSource
extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(productViewModel.products.count)")
        return productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Identifiers.CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.CELL_ID, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        let product = productViewModel.products[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
}
