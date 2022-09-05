

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

class UserSelectedViewController: UIViewController {
    
    private let viewModel: UserSelectedViewModel
    private var contentView: UserSelectedView?
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: UserSelectedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        contentView = UserSelectedView()
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
