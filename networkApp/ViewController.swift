//
//  ViewController.swift
//  networkApp
//
//  Created by Клоун on 08.08.2022.
//

import UIKit

class ViewController: UIViewController {

    private let phoneNumber = "380662774063"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataBase()
    }

    private func getDataBase() {
        let url = "https://phonevalidation.abstractapi.com/v1/?api_key=e695a2561b2e481890476de400cec663&phone=\(phoneNumber)"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            do {
                let dataBase = try JSONDecoder().decode(Phone.self, from: data)
                print(dataBase)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }

}

