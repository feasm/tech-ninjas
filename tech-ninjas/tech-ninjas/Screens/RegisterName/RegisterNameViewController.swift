// 
//  RegisterNameViewController.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 06/10/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class RegisterNameViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: RegisterNameViewModel
    lazy private var contentView: RegisterNameView = {
        RegisterNameView()
    }()
    
    //MARK: - Init
    init(viewModel: RegisterNameViewModel) {
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
    }
    
    //MARK: - Methods
    private func setupBindings() {
        /*
         contentView.searchTextField.addTarget(self, action: #selector(onUpdateSearchText), for: .editingChanged)
         contentView.selectButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
         */
    }
    
    private func setup() {
        setupBindings()
    }
    
    //MARK: - Keyboard
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -200
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    //MARK: - Validation
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
//    private var isValidName: Observable<Bool> {
//        return nameSubject.map { $0!.validateName() }
//    }

}

//MARK: - Preview
struct RegisterNameViewController_Previews: PreviewProvider {
    static var previews: some View {
        let service = RegisterNameServiceMock()
        let viewModel = RegisterNameViewModelImpl(service: service)
        ViewControllerPreview {
        RegisterNameViewController(viewModel: viewModel)
        }
    }
}
