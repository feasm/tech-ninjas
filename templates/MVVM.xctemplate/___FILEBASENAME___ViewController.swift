// ___FILEHEADER___

import UIKit
import SwiftUI

import TNCore
import TNUI

class ___VARIABLE_screenName:identifier___ViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: ___VARIABLE_screenName:identifier___ViewModel
    lazy private var contentView: ___VARIABLE_screenName:identifier___View = {
        ___VARIABLE_screenName:identifier___View()
    }()
    
    //MARK: - Init
    init(viewModel: ___VARIABLE_screenName:identifier___ViewModel) {
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
        view.backgroundColor = .green // testing purposes only
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
struct ___VARIABLE_screenName:identifier___ViewController_Previews: PreviewProvider {
    static var previews: some View {
        let service = ___VARIABLE_screenName:identifier___ServiceMock()
        let viewModel = ___VARIABLE_screenName:identifier___ViewModelImpl(service: service)
        ViewControllerPreview {
        ___VARIABLE_screenName:identifier___ViewController(viewModel: viewModel)
        }
    }
}
