//
//  View.swift
//  ios10-hw17-ozmanyan amo
//
//  Created by Amahastla on 17.08.2023.
//

import UIKit
import SnapKit

class BruteForceView: UIView {
    
    // MARK: = PRroperties
     lazy var buttonForRandomPassword: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.clipsToBounds = true
            button.layer.cornerRadius = 25
            button.setTitle("random password", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = .zero
            button.layer.shadowRadius = 10
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            return button
    }()
    
     lazy var passwordTextField: UITextField = {
            let passwordTextField = UITextField()
            passwordTextField.textColor = .gray
            passwordTextField.textAlignment = .center
            passwordTextField.placeholder = "password"
            passwordTextField.backgroundColor = .lightGray
            passwordTextField.layer.cornerRadius = 25
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            return passwordTextField
        }()

     lazy var buttonForChangeBackgroundColor: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.clipsToBounds = true
            button.layer.cornerRadius = 25
            button.setTitle("change background color", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = .zero
            button.layer.shadowRadius = 10
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            return button
        }()

     lazy var labelWithPaasword: UILabel = {
            let label = UILabel()
            label.textColor = .black
         label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 2
            label.textAlignment = .center
            return label
        }()

     lazy var activityIndicator: UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.isHidden = true
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            return activityIndicator
        }()

    //MARK: - SetupHierarchy
     func setupHierarchy() {
            addSubview(buttonForRandomPassword)
            addSubview(passwordTextField)
            addSubview(buttonForChangeBackgroundColor)
            addSubview(labelWithPaasword)
            addSubview(activityIndicator)
        }
    
    //MARK: - SetupLayout
    private func setupLayout() {
        activityIndicator.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        
        labelWithPaasword.snp.makeConstraints { make in
            
            make.top.equalTo(activityIndicator).inset(70)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        buttonForRandomPassword.snp.makeConstraints { make in
                    
                    make.top.equalTo(labelWithPaasword).inset(70)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                }
                
                passwordTextField.snp.makeConstraints { make in
                    
                    make.top.equalTo(buttonForRandomPassword).inset(70)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                }
                
        buttonForChangeBackgroundColor.snp.makeConstraints { make in
                    
                    make.top.equalTo(passwordTextField).inset(70)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                }
                
    }
    
    init() {
            super.init(frame: .zero)
            commonInit()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }

        private func commonInit() {
            backgroundColor = .white
            setupHierarchy()
            setupLayout()
        }

}
