//
//  MainViewController.swift
//  shopeCard
//
//  Created by SID on 04/10/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapProductPage(_ sender: Any) {
        if let detailVC = Identifiers.Storyboard.instantiateViewController(withIdentifier: Identifiers.PRODUCT_PAGE_ID) as? ProductViewController {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    @IBAction func didTapUserPgae(_ sender: Any) {
        if let detailVC = Identifiers.Storyboard.instantiateViewController(withIdentifier: Identifiers.USER_PAGE_ID) as? UserDetailsViewController {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

    

}
