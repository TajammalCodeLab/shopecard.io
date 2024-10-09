//
//  DataManagerProtocol.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import RxSwift

protocol DataManagerProtocol {
    func fetchProducts () ->Observable<[ProductModel]>
}
