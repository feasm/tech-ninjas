//
//  FeatureViewController.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import SwiftUI

import TNCore
import TNUI

protocol HomeCoordinator {
    func showSelectUsers()
}

class HomeViewController: UIViewController {
    
    lazy private var selectUsersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to SelectUsers", for: .normal)
        button.backgroundColor = .red
        
        return button
    }() //@autoclosure
    
    private let coordinator: HomeCoordinator
    private let disposeBag = DisposeBag()
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        view.addSubview(selectUsersButton)
        
        selectUsersButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.center.equalToSuperview()
        }
        
        selectUsersButton
            .rx
            .tap
            .bind { [weak self] _ in
                self?.coordinator.showSelectUsers()
            }
            .disposed(by: disposeBag)
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

struct FeatureScreenViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            HomeViewController(coordinator: HomeFeatureCoordinator(window: UIWindow(frame: .zero)))
        }
    }
}
