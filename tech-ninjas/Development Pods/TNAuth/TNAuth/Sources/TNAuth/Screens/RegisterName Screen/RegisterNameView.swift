// 
//  RegisterNameView.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 06/10/22.
//

import UIKit
import SwiftUI

import SnapKit
import TNCore
import TNUI

class RegisterNameView: UIView {
    
    //MARK: - Properties
    private struct Constants {
        static let margin: CGFloat = 24
    }
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Sign up"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        return title
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        let imageButton = UIImage(named: "caret-left")
        button.setImage(imageButton, for: .normal)
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var userInfoLabel: UILabel = {
        let label = UILabel()
        let normalText = "What's your "
        let boldText  = "name?"
        
        var fullString = NSMutableAttributedString(string: normalText)
        var formatToBold = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        var boldString = NSMutableAttributedString(string: boldText, attributes: formatToBold)

        fullString.append(boldString)
        
        label.attributedText = fullString
        
        return label
    }()
    
    lazy var registerTextField: TNRegisterTextField = {
        let textField = TNRegisterTextField()
        textField.placeholder = "Enter name"
        textField.backgroundColor = .registerTextField
        textField.layer.cornerRadius = 6
        
        return textField
    }()
    
    lazy var errorTextLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = ""
        errorLabel.textColor = .errorLabel
        errorLabel.font = UIFont(name: "Poppins", size: 18)
        
        return errorLabel
    }()
    
    lazy var nextButton: TNPrimaryButton = {
        let button = TNPrimaryButton()
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ViewCode
extension RegisterNameView: ViewCoded {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(stackView)
        addSubview(nextButton)
        
        stackView.addArrangedSubview(userInfoLabel)
        stackView.addArrangedSubview(registerTextField)
        stackView.addArrangedSubview(errorTextLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(13)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.topMargin.equalTo(20)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.trailing.equalToSuperview().inset(Constants.margin)
            make.leading.equalToSuperview().inset(Constants.margin)
            
            stackView.setCustomSpacing(12, after: userInfoLabel)
            stackView.setCustomSpacing(12, after: registerTextField)
            
            registerTextField.snp.makeConstraints { make in
                make.height.equalTo(44)
            }
        }
        
        nextButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.margin)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.bottom.equalToSuperview().inset(Constants.margin)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }

}

//MARK: - Preview
struct RegisterNameView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            RegisterNameView()
        }
    }
}
