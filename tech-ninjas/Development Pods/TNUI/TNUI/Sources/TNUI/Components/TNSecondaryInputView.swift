//
//  TNSecondaryInputView.swift
//  TNUI
//
//  Created by Gustavo Minatti on 13/10/22.
//

import UIKit
import SwiftUI
import TNCore
import SnapKit

public class TNSecondaryInputView: UIView {
    
    //MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = titleLabelString
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        
        return stack
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = placeholderString
        textField.font = UIFont.systemFont(ofSize: 18)
        
        return textField
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: nameIconString)
        
        return imageView
    }()
    
    lazy var lineFill: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        
        return line
    }()
    
    var titleLabelString: String
    var nameIconString: String
    var placeholderString: String
    
    //MARK: - Init
    public init(titleLabel: String, nameIcon: String, placeholder: String) {
        self.titleLabelString = titleLabel
        self.nameIconString = nameIcon
        self.placeholderString = placeholder
        
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ViewCode
extension TNSecondaryInputView: ViewCoded {
    public func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(stackView)
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(textField)
        
        addSubview(lineFill)
    }
    
    public func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()

            iconImageView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.height.width.equalTo(25)
            }
            
            textField.snp.makeConstraints { make in
                make.top.equalToSuperview()
            }

            stackView.setCustomSpacing(10, after: iconImageView)
        }
        
        lineFill.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(7)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }

    }
    
    public func addAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    
}

////MARK: - Preview
//struct TNSecondaryInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPreview {
//            TNSecondaryInputView()
//        }
//    }
//}
