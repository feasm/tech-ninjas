//
//  FeatureViewController.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

struct FeatureScreenViewModelInput {

}

struct FeatureScreenViewModelOutput {
    
}

protocol FeatureScreenViewModel {
    var input: FeatureScreenViewModelInput { get }
    var output: FeatureScreenViewModelOutput? { get }
}

final class FeatureScreenViewModelImpl: FeatureScreenViewModel {
    
    var input: FeatureScreenViewModelInput
    var output: FeatureScreenViewModelOutput?
    
    let disposeBag = DisposeBag()
    
    init(input: FeatureScreenViewModelInput) {
        self.input = input
    }
    
}

class FeatureScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FeatureScreenView: ViewCoded {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func addAdditionalConfiguration() {
        
    }
}

class FeatureScreenViewController: UIViewController {
    
    private let viewModel: FeatureScreenViewModel
    private var contentView: FeatureScreenView?
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: FeatureScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        contentView = FeatureScreenView()
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
