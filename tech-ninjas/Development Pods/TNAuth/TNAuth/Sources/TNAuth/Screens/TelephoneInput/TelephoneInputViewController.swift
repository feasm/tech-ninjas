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
    private var viewModel: TelephoneInputViewModelImpl
    lazy private var contentView: TelephoneInputView = {
        TelephoneInputView()
    }()
    
    //MARK: - Init
    init(viewModel: TelephoneInputViewModelImpl) {
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
        /*
         contentView.searchTextField.addTarget(self, action: #selector(onUpdateSearchText), for: .editingChanged)
         contentView.selectButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
         */
        contentView.backButton.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        contentView.nextButton.addTarget(self, action: #selector(errorLabelHidden), for: .touchUpInside)
        contentView.registerTextField.addTarget(self, action: #selector(mobileNumMask), for: .allEditingEvents)
    }
    
    @objc func dismissScreen() {
        viewModel.showNameInput()
    }
    
    @objc func errorLabelHidden() {
        errorLabel()
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


    
