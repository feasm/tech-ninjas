//
//  TelephoneInputViewController.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 28/10/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class TelephoneInputViewController: UIViewController{
    
    //MARK: - Properties
    private var viewModel: TelephoneInputViewModel
    lazy private var contentView: TelephoneInputView = {
        TelephoneInputView()
    }()
    
    //MARK: - Init
    init(viewModel: TelephoneInputViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configKeyboard()
        
    }
    
    //MARK: - Methods
    private func setupBindings() {
        contentView.backButton.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        contentView.nextButton.addTarget(self, action: #selector(errorLabelHidden), for: .touchUpInside)
        contentView.registerTextField.addTarget(self, action: #selector(mobileNumMask), for: .allEditingEvents)
    }
    
    @objc func dismissScreen() {
        viewModel.showNameInput()
    }
    
    @objc func errorLabelHidden() {
        errorLabel()
        guard let number = contentView.registerTextField.text else { return }
        viewModel.validateTelephoneInput(number: number)
    }
    
    @objc func mobileNumMask() {
        let number = contentView.registerTextField.text!
        contentView.registerTextField.text = viewModel.maskMobileNumber(number)

    }
    
    private func setup() {
        setupBindings()
    }
    
    //MARK: - Keyboard
    
    func configKeyboard() {
        self.showKeyboardWhenTappedAround()
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(keyboardShowNotification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(keyboardHideNotification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func handle(keyboardShowNotification notification: Notification){
        // 1
        print("Keyboard show notification")
        
        // 2
        if let userInfo = notification.userInfo,
            // 3
            let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            print(keyboardRectangle.height)
            moveUp(keyboardHeight: Int(keyboardRectangle.height))
        }
    }
    
    func moveUp(keyboardHeight: Int) {
        contentView.nextButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().inset(keyboardHeight + 24)
        }
    }
    
    @objc func handle(keyboardHideNotification notification: Notification){
        // 1
        print("Keyboard show notification")
        
        // 2
        if let userInfo = notification.userInfo,
            // 3
            let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            print(keyboardRectangle.height)
            moveDown()
        }
    }
    
    func moveDown() {
        contentView.nextButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Validation
    
    func errorLabel() {
        if contentView.registerTextField.hasText == true {
            contentView.errorLabelTelephoneInput.isHidden = true
        } else {
            contentView.errorLabelTelephoneInput.isHidden = false
            contentView.registerTextField.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        }
    }
    
    
}


    
