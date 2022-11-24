//
//  NameInputView.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 28/10/22.
//

import UIKit
import SwiftUI

import SnapKit
import TNCore
import TNUI

class NameInputView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var titleLabel:UILabel = {
        let title = UILabel()

        title.text = "Sign up"
        title.font = UIFont.boldSystemFont(ofSize: 20)

        return title
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        
        let buttonImage = UIImage(systemName: "return")
        button.setImage(buttonImage, for: .normal)
             
        return button
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical

        return stackView
    }()
    
    lazy var userInfoLabel: UILabel = {
        let label = UILabel()
        
        var normalText = "What's your "

        var boldText  = "name"
        
        var q = "?"

        var attributedString = NSMutableAttributedString(string:normalText)

        var attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        var boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
        
        var attributedStringq = NSMutableAttributedString(string: q)
        attributedString.append(boldString)
        attributedString.append(attributedStringq)
        
        label.attributedText = attributedString
        
        return label
    }()
    
    lazy var registerTextField:UITextField = {
        let textfield = UITextField()
        
        textfield.keyboardType = .default
        textfield.placeholder = "James Harrid"
        textfield.backgroundColor = #colorLiteral(red: 0.8993844697, green: 0.8993844697, blue: 0.8993844697, alpha: 1)
        textfield.setLeftPaddingPoints(15)
        textfield.setRightPaddingPoints(10)
        textfield.setRounded()
        textfield.adjustsFontSizeToFitWidth = true
    
        
        return textfield
    }()
    
    lazy var errorLabelInputName:UILabel = {
        let error = UILabel()
        
        error.isHidden = true
        error.text = "This field can't be blank."
        error.textColor = .red
        

        return error
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = #colorLiteral(red: 0.2205340872, green: 0.3245643842, blue: 1, alpha: 1)
        button.setTitle("Next", for: .normal)
        button.setRounded()

        return button
    }()

    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NameInputView: ViewCoded {
    
    func buildViewHierarchy() {
        
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(stackView)
        addSubview(nextButton)
        
        stackView.addArrangedSubview(userInfoLabel)
        stackView.addArrangedSubview(registerTextField)
        stackView.addArrangedSubview(errorLabelInputName)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(13)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.topMargin.equalTo(20)
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(24)
            
            stackView.setCustomSpacing(12, after: userInfoLabel)
            stackView.setCustomSpacing(12, after: registerTextField)

            registerTextField.snp.makeConstraints { make in
                make.height.equalTo(44)
            }
            
            errorLabelInputName.snp.makeConstraints { make in
                make.top.equalTo(registerTextField.snp.bottom).offset(12)
            }
        }
        
        
        nextButton.snp.makeConstraints { make in
            
            make.bottom.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(44)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}



#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14, *)
struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            NameInputView()
        }
        
        .previewDevice("iPhone 12")
    }
}
#endif
