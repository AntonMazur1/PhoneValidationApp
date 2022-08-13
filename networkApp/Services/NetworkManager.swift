//
//  NetworkManager.swift
//  networkApp
//
//  Created by Клоун on 11.08.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getphoneInfo(from url: String?, completion: @escaping (Phone) -> Void ) {
        guard let url = URL(string: url ?? "") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            do {
                let phoneInfo = try JSONDecoder().decode(Phone.self, from: data)
                DispatchQueue.main.async {
                    completion(phoneInfo)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private init() {}
}
