//
//  UserModel.swift
//  shopeCard
//
//  Created by SID on 01/10/2024.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int?
    let email: String?
    let username: String?
    let password: String?
    let name: Name?
    let address: Address?
    let phone: String?
}

// MARK: - Address
struct Address: Codable {
    let city, street: String?
    let number: Int?
    let zipcode: String?
    let geolocation: Geolocation?
}

// MARK: - Geolocation
struct Geolocation: Codable {
    let lat, long: String?
}

// MARK: - Name
struct Name: Codable {
    let firstname, lastname: String?
}

