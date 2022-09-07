// ___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

class ___VARIABLE_screenName:identifier___ViewController: UIViewController {
    
    private let viewModel: ___VARIABLE_screenName:identifier___ViewModel
    private var contentView: ___VARIABLE_screenName:identifier___View?
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: ___VARIABLE_screenName:identifier___ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        contentView = ___VARIABLE_screenName:identifier___View()
        view = contentView
        view.backgroundColor = .green // testing purposes only
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    private func setupBindings() {
        /*
         viewModel
            .output
            .onFilter
            .drive { [weak self] text in
                // do something with text
            }
            .disposed(by: disposeBag)
         */
    }

}
