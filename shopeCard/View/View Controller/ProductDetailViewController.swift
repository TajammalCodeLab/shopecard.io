//
//  ProductDetailViewController.swift
//  shopeCard
//
//  Created by SID on 03/10/2024.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subcontainerView: UIView!
    
    var selectedProduct: ProductModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        
    }
    
    
    func updateUI() {
        containerView.addRadiusAndShadow(12)
        subcontainerView.addRadiusAndShadow(5)
        
        if let selectedProduct = selectedProduct {
            productPrice.text = "$\(selectedProduct.price ?? 0.0)"
            productDescription.text = selectedProduct.description
            productCategory.text = "\(selectedProduct.category ?? "NO CATEGORY") - \(selectedProduct.rating?.rate ?? 0.0) - \(selectedProduct.rating?.count ?? 0)"
            
            // Load the image if available
            if let imageUrlString = selectedProduct.image, let imageUrl = URL(string: imageUrlString) {
                productImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholderImage"), options: .highPriority) { (image, error, cacheType, url) in
                    // Optional: Handle image loading completion
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                    }
                }
            }
        }
        
    }
}

