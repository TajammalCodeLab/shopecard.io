//
//  JSONHandler.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation

struct JSONHandler {
    static func arrangedResponseData(_ responseData: Data) -> String? {
        do {
            // Decode the JSON data to a JSONObject
            let jsonObject = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            
            // Encode the JSONObject back to JSON data with pretty printing
            let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            // Convert the JSON data to a string
            if let responseDataString = String(data: prettyPrintedData, encoding: .utf8) {
                return responseDataString
            }
        } catch {
            print("Failed to parse response data:", error)
            return nil
        }
        return nil
    }
}
