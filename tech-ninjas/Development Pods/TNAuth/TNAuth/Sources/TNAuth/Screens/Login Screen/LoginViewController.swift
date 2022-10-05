// 
//  LoginViewController.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: LoginViewModel
    lazy private var contentView: LoginView = {
        LoginView()
    }()
    
    //MARK: - Init
    init(viewModel: LoginViewModel) {
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
//        view.backgroundColor = .white
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

}

//MARK: - Preview
struct LoginViewController_Previews: PreviewProvider {
    static var previews: some View {
        let service = LoginServiceMock()
        let viewModel = LoginViewModelImpl(service: service)
        ViewControllerPreview {
        LoginViewController(viewModel: viewModel)
        }
    }
}
