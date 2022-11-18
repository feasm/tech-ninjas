//
//  NameInputViewController.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 28/10/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class NameInputViewController: UIViewController{
    
    //MARK: - Properties
    private var viewModel: NameInputViewModelImpl
    lazy private var contentView: NameInputView = {
        NameInputView()
    }()
    
    //MARK: - Init
    init(viewModel: NameInputViewModelImpl) {
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
        contentView.nextButton.addTarget(self, action: #selector(isNameValid), for: .touchUpInside)
        contentView.nextButton.addTarget(self, action: #selector(errorLabelHidden), for: .touchUpInside)
        contentView.backButton.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
    
    }
    
    @objc func isNameValid() {
        guard let name = contentView.registerTextField.text else { return }
        viewModel.validateNameInput(name: name)
    }
    
    @objc func errorLabelHidden() {
        errorLabel()
    }
    
    @objc func dismissScreen() {
        viewModel.showLoginScreen()
    }
    
    private func setup() {
        setupBindings()
    }
    //MARK: - Keyboard
    
    func configKeyboard() {
        self.showKeyboardWhenTappedAround()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - Validation
    
    func errorLabel() {
        if contentView.registerTextField.hasText == true {
            contentView.errorLabelInputName.isHidden = true
        } else {
            contentView.errorLabelInputName.isHidden = false
            contentView.registerTextField.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        }
    }
    
    
    
    //MARK: - Preview
//    struct NameInputViewController_Previews: PreviewProvider {
//        static var previews: some View {
//            let service = NameInputServiceMock()
//            let viewModel = NameInputViewModelImpl(service: service)
//            ViewControllerPreview {
//                NameInputViewController(viewModel: viewModel)
//            }
//        }
//    }
}
