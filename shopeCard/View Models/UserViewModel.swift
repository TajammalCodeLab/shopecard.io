//
//  UserViewModel.swift
//  shopeCard
//
//  Created by SID on 04/10/2024.
//

import Foundation
import UIKit
class UserViewModel {
    
    var users: [UserModel] = []
    var userDetail: [UserModel] = []
    
    var onProductsFetched: (() -> Void)?
    
    func fetchProducts() {
        DataManager.shared.getUsers { (result:Result<[UserModel], ApiError>) in
            
            switch result {
            case .success(let users):
                self.onProductsFetched?()
                self.users = users
                print("----------------------:  \(self.users.isEmpty) ----------------------- \(self.users.count) ----------------------- \n")
                
            case .failure(let error):
                print( StringConstants.errorMessage + "\(error)")
                
            }
        }
    }
    
}
