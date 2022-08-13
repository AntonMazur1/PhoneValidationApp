//
//  ViewController.swift
//  networkApp
//
//  Created by Клоун on 08.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.isEnabled = false
        numberTextField.delegate = self
        infoLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func getInfoAboutNumber() {
        guard let number = numberTextField.text else { return }
        let url = "https://phonevalidation.abstractapi.com/v1/?api_key=e695a2561b2e481890476de400cec663&phone=\(number.trimmingCharacters(in: .whitespaces))"
        
        NetworkManager.shared.getphoneInfo(from: url) { [weak self] phoneInfo in
            if phoneInfo.valid {
                self?.infoLabel.text =
                    """
                    Phone: \(phoneInfo.phone)
                    Type: \(phoneInfo.type)
                    Carrier: \(phoneInfo.carrier)
                    Country name: \(phoneInfo.country.name)
                    Country prefix: \(phoneInfo.country.prefix)
                    Country code: \(phoneInfo.country.code)
                    Location: \(phoneInfo.location)
                    International format: \(phoneInfo.format.international)
                    Local format: \(phoneInfo.format.local)
                    Valid: \(phoneInfo.valid ? "Yes" : "No")
                    """
            } else {
                self?.infoLabel.text =
                     """
                    Something went wrong!
                    
                    Please, check your number and try again
                    """
            }
            self?.infoLabel.isHidden = false
        }
    }
}

//MARK: UITextField Delegate
extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text else {
            return false
        }
        
        let newText = (oldText as NSString).replacingCharacters(in: range, with: string)
        checkButton.isEnabled = !newText.isEmpty
        
        return true
    }
}
