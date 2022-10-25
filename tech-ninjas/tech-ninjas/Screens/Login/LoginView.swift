// 
//  LoginView.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import UIKit
import SwiftUI

import SnapKit
import TNCore
import TNUI

class LoginView: UIView {
    
    private struct Constants {
        static let margin: CGFloat = 24
        static let sizeButton: CGFloat = 44
        static let spacingButton: CGFloat = 18
    }
    
    //MARK: - Properties
    lazy var titleAppLabel: UILabel = {
        let label = UILabel()
        label.text = "Tech Ninjas"
        label.font = UIFont.boldSystemFont(ofSize: 32)
//        label.font = UIFont(name: "Poppins", size: 32)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        
        return stack
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        let imageButton = UIImage(named: "login-google")
        button.setImage(imageButton, for: .normal)
        
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        let imageButton = UIImage(named: "login-facebook")
        button.setImage(imageButton, for: .normal)
        
        return button
    }()
    
    lazy var appleButton: UIButton = {
        let button = UIButton()
        let imageButton = UIImage(named: "login-apple")
        button.setImage(imageButton, for: .normal)
        
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var emailToFill: TNSecondaryInputView = {
        let email = TNSecondaryInputView(titleLabel: "Email", nameIcon: "email-icon", placeholder: "Enter your email")
        
        return email
    }()
    
    lazy var passwordToFill: TNSecondaryInputView = {
        let email = TNSecondaryInputView(titleLabel: "Password", nameIcon: "password-icon", placeholder: "Enter your password")
        
        return email
    }()
    
    lazy var checkBox: CheckBox = {
        let checkBox = CheckBox(type: .custom)
        checkBox.setTitle("Remember me", for: .normal)
        
        return checkBox
    }()
    
    lazy var signInButton: TNPrimaryButton = {
        let button = TNPrimaryButton()
        button.setTitle("Sign in", for: .normal)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    lazy var forgotPassButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.primaryBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        return button
    }()
    
    lazy var signUpButton: TNQuestionAnswerView = {
        let button = TNQuestionAnswerView(question: "Don't have an account?", buttonName: " Sign Up")

        
        return button
    }()
    
//    lazy var hiddenPasswordButton: UIButton = {
//        let button = UIButton()
//        let imageButton = UIImage(named: "hidden-icon")
//        button.setImage(imageButton, for: .normal)
//
//        return button
//    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc func goToRegisterAccount() {
//        let registerVC = RegistrationViewController()
//        navigationController?.pushViewController(registerVC, animated: true)
        print("Sign Up works")
    }
    
}

//MARK: - ViewCode
extension LoginView: ViewCoded {
    func buildViewHierarchy() {
        addSubview(titleAppLabel)
        
        addSubview(stackView)
        stackView.addArrangedSubview(googleButton)
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(appleButton)
        
        addSubview(orLabel)
        addSubview(emailToFill)
        addSubview(passwordToFill)
        addSubview(checkBox)
        addSubview(signInButton)
        addSubview(forgotPassButton)
        addSubview(signUpButton)
    }
    
    func setupConstraints() {
        titleAppLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview().inset(88)
        }
        
        stackView.snp.makeConstraints { make in
            googleButton.snp.makeConstraints { make in
                make.height.equalTo(Constants.sizeButton)
                make.width.equalTo(Constants.sizeButton)
            }
            
            facebookButton.snp.makeConstraints { make in
                make.height.equalTo(Constants.sizeButton)
                make.width.equalTo(Constants.sizeButton)
            }
            
            appleButton.snp.makeConstraints { make in
                make.height.equalTo(Constants.sizeButton)
                make.width.equalTo(Constants.sizeButton)
            }
            
            make.centerX.equalToSuperview()
            make.top.equalTo(titleAppLabel.snp.bottom).offset(50)
            
            stackView.setCustomSpacing(Constants.spacingButton, after: googleButton)
            stackView.setCustomSpacing(Constants.spacingButton, after: facebookButton)
        }
        
        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(32)
        }
        
        emailToFill.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.trailing.equalToSuperview().inset(Constants.margin)
        }
        
        passwordToFill.snp.makeConstraints { make in
            make.top.equalTo(emailToFill.snp.bottom).offset(28)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.trailing.equalToSuperview().inset(Constants.margin)
        }
        
        checkBox.snp.makeConstraints { make in
            make.top.equalTo(passwordToFill.snp.bottom).offset(28)
            make.leading.equalToSuperview().inset(Constants.margin)
        }
        
        signInButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.margin)
            make.trailing.equalToSuperview().inset(Constants.margin)
            make.top.equalTo(checkBox.snp.bottom).offset(28)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(28)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).inset(Constants.margin)
        }
        
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}

//MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            LoginView()
        }
    }
}
