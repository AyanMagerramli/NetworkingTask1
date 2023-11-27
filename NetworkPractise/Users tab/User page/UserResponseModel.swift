//
//  UserResponseModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

typealias Welcome = [UserInfo]

    // MARK: - WelcomeElement
struct UserInfo: Codable, UserCellProtocol, UserDetailsCellProtocol {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
    
    var userName: String {
        name ?? ""
    }
    
    var userEmail: String {
        email ?? ""
    }
    
    var userCompany: String {
        company?.name ?? ""
    }
    
    var userPhone: String {
        phone ?? ""
    }
    
    var userAddress: String {
        if let street = address?.street,
           let suite = address?.suite,
           let city = address?.city,
           let zipcode = address?.zipcode{
            return "\(street) \(suite) \(city)/\(zipcode)"
        } else {
            return ""
        }
    }
}
    // MARK: - Address
    struct Address: Codable {
        let street, suite, city, zipcode: String?
        let geo: Geo?
    }

    // MARK: - Geo
    struct Geo: Codable {
        let lat, lng: String?
    }

    // MARK: - Company
    struct Company: Codable {
        let name, catchPhrase, bs: String?
    }

   
