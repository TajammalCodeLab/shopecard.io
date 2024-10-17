//
//  BaseApi.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire
import Combine
import PromiseKit


open class BaseApi {
    
    static func request<T: Decodable>(route: Alamofire.URLRequestConvertible) -> AnyPublisher<T, Error> {
            return Future { promise in
                firstly {
                    self.performRequest(route: route)
                }.done { (value: T, data: Data?) in
                    promise(.success(value))
                    if let data = data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                    }
                    self.didConvertJSONPretty(data: data)
                }.catch { error in
                    promise(.failure(error))
                }
            }
            .eraseToAnyPublisher()
        }

    private static func performRequest<T: Decodable>(route: Alamofire.URLRequestConvertible) -> Promise<(T, Data?)> {
            return Promise { seal in
                AF.request(route).responseDecodable { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let value):
                        seal.fulfill((value, response.data))
                    case .failure(let error):
                        if let data = response.data {
                            self.didConvertJSONPretty(data: data)
                        }
                        seal.reject(error)
                    }
                }
            }
        }
    
    
    private static func didConvertJSONPretty(data: Data?) {
        if let data = data {
            if let prettyJson = JSONHandler.arrangedResponseData(data) {
                print("<<<<<<<<<<<<<<<<< Data:\n\(String(describing: prettyJson))")
            } else {
                print("Failed to get pretty JSON")
            }
        }
    }
}
