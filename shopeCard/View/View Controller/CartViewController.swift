//
//  CartViewController.swift
//  shopeCard
//
//  Created by SID on 14/10/2024.
//

import UIKit

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    private var cartVM = CartViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateTotalPrice()
    }
    
    private func setupTableView() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(UINib(nibName: Identifiers.USER_XiB_NANME, bundle: nil), forCellReuseIdentifier: Identifiers.CART_CELL_ID)
    }
    
    private func updateTotalPrice() {
        
    }
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartVM.cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.CART_CELL_ID, for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }
        
        let product = cartVM.cartProducts[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
}
