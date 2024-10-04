//
//  UserDetailsTableViewCell.swift
//  shopeCard
//
//  Created by SID on 03/10/2024.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    @IBOutlet weak var userPhoneNo: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with userData: UserModel) {
        
        userFullName.text = "\(userData.name?.firstname ?? "") \(userData.name?.lastname ?? "")"
        userName.text = userData.username?.lowercased()
        UserEmail.text = "\(userData.email?.lowercased() ?? "")"
        userPhoneNo.text = "\(userData.phone ?? "0")"
        userAddress.text = "\(userData.address?.street ?? "") , \(userData.address?.city ?? "") , \(userData.address?.zipcode ?? "")"
    }
    
    
}
