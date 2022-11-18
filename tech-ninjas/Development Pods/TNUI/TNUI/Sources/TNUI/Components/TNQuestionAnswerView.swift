//
//  TNQuestionAnswerView.swift
//  TNUI
//
//  Created by Gustavo Minatti on 14/10/22.
//

import UIKit
import TNCore
import SnapKit

public class TNQuestionAnswerView: UIView {
    
    var questionName: String
    var buttonName: String
//    var viewController: UIViewController
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        
        return stack
    }()
    
    lazy public var answerButton: UIButton = {
        let button = UIButton()
        button.setTitle(buttonName, for: .normal)
        button.setTitleColor(.primaryBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return button
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = questionName
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
        
    public init(question: String, buttonName: String) {
        self.questionName = question
        self.buttonName = buttonName
//        self.viewController = viewController

        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions #Selectors
    @objc private func goToViewController() {
        print("Its Works =)")
    }

    
}

extension TNQuestionAnswerView: ViewCoded {
    public func buildViewHierarchy() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(answerButton)
    }
    
    public func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
            stackView.setCustomSpacing(3, after: questionLabel)
        }
        
    }
    
    public func addAdditionalConfiguration() {
//        backgroundColor = .systemRed
    }
    
    
}
