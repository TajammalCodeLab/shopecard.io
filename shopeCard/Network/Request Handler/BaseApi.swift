//
//  BaseApi.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire


class BaseApi {
    
    static func request<T: Codable>(urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, ApiError>) -> Void){
        /// Perform the network request on a background thread
        DispatchQueue.global().async {
            
            AF.request(urlConvertible).validate(statusCode: 200..<300).responseDecodable {(response: DataResponse<T,AFError>) in
                /// Process the response on the main thread
                DispatchQueue.main.async {
                    handleResponse(response, completion: completion)
                }
            }
        }
    }
    
    
    //MARK: -  Helper function to handle the response
    private static func handleResponse<T: Codable>(_ response: DataResponse<T, AFError>, completion: @escaping (Result<T, ApiError>) -> Void){
        switch response.result {
        case .success(let responseData):
            /// Decode the response data to the specified type
            didConvertJSONPretty(data: response.data)
            completion(.success(responseData))
        case .failure(let error):
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8){
                print("<<<<<<<<<<<<<<<<< Error Response: \(utf8Text)")
                print("<<<<<<<<<< Error Message = ", error)
                do {
                    let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let message = jsonDictionary?["message"] as? String ?? ""
                    let statusCode = response.response?.statusCode ?? 0
                    let failureError = ApiError(message: message, statusCode: statusCode)
                    completion(.failure(failureError))
                } catch {
                    let message = error.localizedDescription
                    let statusCode = response.response?.statusCode ?? 0
                    let failureError = ApiError(message: message, statusCode: statusCode)
                    completion(.failure(failureError))
                }
            }
        }
    }
    
    
    private static func didConvertJSONPretty(data : Data?){
        if let data = data {
            if let prettyJson = JSONHandler.arrangedResponseData(data){
                print("<<<<<<<<<<<<<<<<< Data:\n\(String(describing: prettyJson))")
            } else {
                print("Failed to get pretty JSON")
            }
        }
    }
}
