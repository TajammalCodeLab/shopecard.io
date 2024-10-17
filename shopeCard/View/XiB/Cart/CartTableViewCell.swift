//
//  CartTableViewCell.swift
//  shopeCard
//
//  Created by SID on 03/10/2024.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with product: ProductModel) {
        productTitle.text = product.title
        productPrice.text = "\(product.price ?? 0.0)"
    }
    
    
}
