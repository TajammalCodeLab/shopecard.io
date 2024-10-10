//
//  BaseApi.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire
import Combine

open class BaseApi {
    
    internal static func request<T: Decodable>(route: URLRequestConvertible) -> AnyPublisher<T, Error> {
        return Future<T, Error> { promise in
            let request = AF.request(route).responseDecodable { (response: DataResponse<T, AFError>) in

                switch response.result {
                case .success(let value):
                    promise(.success(value))
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                    }
                    didConvertJSONPretty(data: response.data)
                    
                case .failure(let error):
                    
                    if let data = response.data, let serverError = String(data: data, encoding: .utf8) {
                        promise(.failure(error))
                        didConvertJSONPretty(data: data)
                    } else {
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
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
