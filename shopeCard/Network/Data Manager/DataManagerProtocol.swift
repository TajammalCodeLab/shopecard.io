//
//  DataManagerProtocol.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import Combine

protocol DataManagerProtocol {
    func fetchProducts () -> AnyPublisher<[ProductModel], Error>
}
