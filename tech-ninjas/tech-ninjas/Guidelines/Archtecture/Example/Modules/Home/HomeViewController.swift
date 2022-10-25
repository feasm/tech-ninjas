//
//  FeatureViewController.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import UIKit
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
    
    }
    
    @objc func tapButton() {
        coordinator.showSelectUsers()
    }
    
    private func setupBindings() {
        selectUsersButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

}

struct FeatureScreenViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            HomeViewController(coordinator: HomeFeatureCoordinator(window: UIWindow(frame: .zero)))
        }
    }
}
