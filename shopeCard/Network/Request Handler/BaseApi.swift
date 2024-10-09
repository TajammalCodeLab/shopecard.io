//
//  BaseApi.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import Alamofire
import RxSwift


open class BaseApi {
    
    internal static func request<T: Decodable>(route: URLRequestConvertible) -> Observable<T> {
        return Observable.create { observer in
            
            let request = AF.request(route).responseDecodable {
                (response: DataResponse<T,AFError>) in
                print("this is a response from the server: \(response)")
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                    print("\(StringConstants.RespnseCodeMSG) \(String(describing: response.response?.statusCode))")
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                    }
                    didConvertJSONPretty(data: response.data)
                case .failure(let error):
                    print("\(StringConstants.RequestFailedMSG)  \(error.localizedDescription) ")
                    
                    if let data = response.data, let serverError = String(data: data, encoding: .utf8) {
                        observer.onError(error)
                        didConvertJSONPretty(data: data)
                    } else {
                        observer.onError(error)
                    }
                    
                }
            }
            return Disposables.create {
                request.cancel()
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
