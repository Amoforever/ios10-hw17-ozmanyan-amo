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
    private lazy var buttonForRandomPassword: UIButton = {
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
            button.addTarget(self, action: #selector(generatePasswordInTextField), for: .touchUpInside)
            return button
    }()
    
    private lazy var passwordTextField: UITextField = {
            let passwordTextField = UITextField()
            passwordTextField.textColor = .gray
            passwordTextField.textAlignment = .center
            passwordTextField.placeholder = "password"
            passwordTextField.backgroundColor = .lightGray
            passwordTextField.layer.cornerRadius = 25
            passwordTextField.isSecureTextEntry = true
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            return passwordTextField
        }()

    private lazy var buttonForChoosePassword: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.clipsToBounds = true
            button.layer.cornerRadius = 25
            button.setTitle("choose password", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = .zero
            button.layer.shadowRadius = 10
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            button.addTarget(self, action: #selector(generatePasswordInLabel), for: .touchUpInside)
            return button
        }()

    private lazy var labelWithPaasword: UILabel = {
            let label = UILabel()
            label.text = "password"
            label.textColor = .black
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            return label
        }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.isHidden = true
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            return activityIndicator
        }()

    //MARK: - SetupHierarchy
    private func setupHierarchy() {
            addSubview(buttonForRandomPassword)
            addSubview(passwordTextField)
            addSubview(buttonForChoosePassword)
            addSubview(labelWithPaasword)
            addSubview(activityIndicator)
        }
    
    //MARK: - SetupLayout
    private func setupLayout() {
        buttonForRandomPassword.snp.makeConstraints { make in
                    
                    make.top.equalToSuperview().inset(150)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(300)
                    make.height.equalTo(50)
                }
                
                passwordTextField.snp.makeConstraints { make in
                    
                    make.top.equalTo(buttonForRandomPassword).inset(70)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(300)
                    make.height.equalTo(50)
                }
                
                buttonForChoosePassword.snp.makeConstraints { make in
                    
                    make.top.equalTo(passwordTextField).inset(70)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(300)
                    make.height.equalTo(50)
                }
                
                labelWithPaasword.snp.makeConstraints { make in
                    
                    make.top.equalTo(buttonForChoosePassword).inset(70)
                    make.left.equalToSuperview()
                    make.width.equalTo(240)
                    make.height.equalTo(50)
                }
                
                activityIndicator.snp.makeConstraints { make in
                    
                    make.left.equalTo(labelWithPaasword).inset(210)
                    make.top.equalTo(buttonForChoosePassword).inset(60)
                    make.width.equalTo(70)
                    make.height.equalTo(70)
                }
    }
    
    private func setupView() {
        backgroundColor = .lightGray
        setupHierarchy()
        setupLayout()
    }

}
