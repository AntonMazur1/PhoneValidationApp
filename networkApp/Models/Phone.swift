//
//  DataBaseModel.swift
//  networkApp
//
//  Created by Клоун on 08.08.2022.
//

import Foundation

struct Phone: Decodable {
    let phone: String
    let valid: Bool
    let format: Format
    let country: Country
    let location: String
    let type: String
    let carrier: String
}

struct Format: Decodable {
    let international: String
    let local: String
}

struct Country: Decodable {
    let code: String
    let name: String
    let prefix: String
}
