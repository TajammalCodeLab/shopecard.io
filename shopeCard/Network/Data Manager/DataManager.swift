//
//  DataManager.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import RxSwift

class DataManager: DataManagerProtocol {
    func fetchProducts() -> RxSwift.Observable<[ProductModel]> {
        return ApiClient.fetchProducts().observe(on: MainScheduler.instance)
    }
    
    
}
