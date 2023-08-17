//
//  Controller.swift
//  ios10-hw17-ozmanyan amo
//
//  Created by Amahastla on 17.08.2023.
//

import UIKit

class ViewControllerOfBruteForceOperation: UIViewController {
    
    //MARK: - Properties
    var bruteForceView: BruteForceView? {
        guard isViewLoaded else { return nil }
        return view as? BruteForceView
    }
    
    var brute = BruteForceOperation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = BruteForceView()
        statusChange(for: .start)
        bruteForceView?.buttonForRandomPassword.addTarget(self, action: #selector(changePassword), for: .touchUpInside)
        bruteForceView?.buttonForChangeBackgroundColor.addTarget(self, action: #selector(changeColorOfView), for: .touchUpInside)
        
    }
    
    var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
    
    @objc func changeColorOfView(_ sender: Any) {
        isBlack.toggle()
    }
    
    @objc func changePassword(_ sender: Any) {
        statusChange(for: .progress)
        bruteForceView?.passwordTextField.text = String().generatePassword()
        let unlockPassword = bruteForceView?.passwordTextField.text?.components(withMaxLength: 3) ?? [""]
        let queue = DispatchQueue(label: "BruteForceOperation", qos: .default, attributes: .concurrent)
        let workItem = DispatchWorkItem { [ self ] in
            for character in unlockPassword {
                brute.bruteForce(passwordToUnlock: character)
            }
        }
        workItem.notify(queue: .main) { [ self ] in
            statusChange(for: .finish)
        }
        queue.async(execute: workItem)
    }
    
    func statusChange(for value: StatusOfBruteForce) {
        switch value {
        case .start:
            bruteForceView?.labelWithPaasword.text = "Получение рандомного пароля"
            bruteForceView?.buttonForRandomPassword.setTitle("random password", for: .normal)
        case .progress:
            bruteForceView?.labelWithPaasword.text = "Можем пока сменить цвет фона"
            bruteForceView?.activityIndicator.isHidden = false
            bruteForceView?.activityIndicator.startAnimating()
            bruteForceView?.passwordTextField.isSecureTextEntry = true
            bruteForceView?.buttonForRandomPassword.isUserInteractionEnabled = false
        case .finish:
            bruteForceView?.activityIndicator.isHidden = true
            bruteForceView?.activityIndicator.stopAnimating()
            bruteForceView?.passwordTextField.isSecureTextEntry = false
            bruteForceView?.labelWithPaasword.text = "Пароль \(self.bruteForceView?.passwordTextField.text ?? "")"
            bruteForceView?.buttonForRandomPassword.isSelected = false
            bruteForceView?.activityIndicator.isHidden = true
            bruteForceView?.buttonForRandomPassword.isUserInteractionEnabled = true
            bruteForceView?.buttonForRandomPassword.setTitle("again", for: .normal)
        }
    }
    
}

