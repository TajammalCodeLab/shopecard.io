//
//  ApiClient.swift
//  shopeCard
//
//  Created by SID on 09/10/2024.
//

import Foundation
import RxSwift
import Alamofire

class ApiClient: BaseApi {
    
    static func fetchProducts()->Observable<[ProductModel]>{
        return request(route: ApiRouter.getProducts)
    }
}
