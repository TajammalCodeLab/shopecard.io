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
    
    
}
