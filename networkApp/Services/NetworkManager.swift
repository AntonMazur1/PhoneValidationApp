//
//  NetworkManager.swift
//  networkApp
//
//  Created by Клоун on 11.08.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getInfoAboutPhone(from url: String, completion: @escaping(Result<Phone, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let infoPhone = Phone.getInfo(from: value)
                    completion(.success(infoPhone))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
