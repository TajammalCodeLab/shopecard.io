//
//  ProductTableViewCell.swift
//  shopeCard
//
//  Created by SID on 01/10/2024.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupActivityIndicator()
    }
    
    private func setupActivityIndicator() {
        // Add the activity indicator to the image view
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        productImage.addSubview(activityIndicator)
        
        // Center the spinner inside the image view
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: productImage.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: productImage.centerYAnchor)
        ])
    }
    
    func configure(with product: ProductModel) {
        
        productPrice.text = "$\(product.price ?? 0)"
        productDescription.text = product.description
        productCount.text = "Count: \(product.rating?.count ?? 0)"
        productRating.text = "Rating: \(product.rating?.rate ?? 0)"
        productCategory.text = product.category
        
        if let imageUrl = product.image, let url = URL(string: imageUrl) {
            loadImage(from: url)
        }
    }
    
    private func loadImage(from url: URL) {
        // Start the activity indicator
        activityIndicator.startAnimating()
        
        // Use SDWebImage to load the image
        productImage.sd_setImage(with: url, completed: { [weak self] _, _, _, _ in
            // Stop the activity indicator when image is loaded
            self?.activityIndicator.stopAnimating()
        })
    }
    
}
