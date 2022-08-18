//
//  DataBaseModel.swift
//  networkApp
//
//  Created by Клоун on 08.08.2022.
//

import Foundation

struct Phone: Codable {
    let phone: String
    let valid: Bool
    let format: Format
    let country: Country
    let location: String
    let type: String
    let carrier: String
    
    init(phoneData: [String:Any]) {
        phone = phoneData["phone"] as? String ?? ""
        valid = phoneData["valid"] as? Bool ?? false
        
        let formatDict = phoneData["format"] as? [String: String] ?? [:]
        format = Format(value: formatDict)
        
        let countryDict = phoneData["country"] as? [String: String] ?? [:]
        country = Country(value: countryDict)
        
        location = phoneData["location"] as? String ?? ""
        
        type = phoneData["type"] as? String ?? ""
        carrier = phoneData["carrier"] as? String ?? ""
    }
    
    static func getInfo(from value: Any) -> Phone {
        guard let phoneInfo = value as? [String: Any] else { return Phone(phoneData: ["": ""]) }
        return Phone(phoneData: phoneInfo)
    }
}

struct Format: Codable {
    let international: String?
    let local: String?
    
    init(value: [String: String]) {
        international = value["international"]
        local = value["local"]
    }
}

struct Country: Codable {
    let code: String?
    let name: String?
    let prefix: String?
    
    init(value: [String: String]) {
        code = value["code"]
        name = value["name"]
        prefix = value["prefix"]
    }
}
