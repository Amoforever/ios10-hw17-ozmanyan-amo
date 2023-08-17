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
        
        bruteForceView?.buttonForRandomPassword.addTarget(self, action: #selector(changePassword), for: .touchUpInside)
        bruteForceView?.buttonForChoosePassword.addTarget(self, action: #selector(changeColorOfView), for: .touchUpInside)
        
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
        bruteForceView?.passwordTextField.text = String().generatePassword()
        let unlockPassword = bruteForceView?.passwordTextField.text?.components(withMaxLength: 3) ?? [""]
        let queue = DispatchQueue(label: "BruteForceOperation", qos: .default, attributes: .concurrent)
        let workItem = DispatchWorkItem { [ self ] in
            for character in unlockPassword {
                brute.bruteForce(passwordToUnlock: character)
            }
        }
        workItem.notify(queue: .main, execute: workItem)
        queue.async(execute: workItem)
    }
    
}

