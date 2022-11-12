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

class NameInputViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: NameInputViewModel
    lazy private var contentView: NameInputView = {
        NameInputView()
    }()
    
    //MARK: - Init
    init(viewModel: NameInputViewModel) {
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
        contentView.backButton.addTarget(self, action: #selector(returnScreen), for: .touchUpInside)
    }
    
    @objc func returnScreen() {
        let vc = TelephoneInputViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private func setup() {
        setupBindings()
    }
    //MARK: - Keyboard
    
    
    
    //MARK: - Validation
    
    
    
    
    //MARK: - Preview
    struct NameInputViewController_Previews: PreviewProvider {
        static var previews: some View {
            let service = NameInputServiceMock()
            let viewModel = NameInputViewModelImpl(service: service)
            ViewControllerPreview {
                NameInputViewController(viewModel: viewModel)
            }
        }
    }
}
