// 
//  SelectUsersCoordinator.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import Foundation
import UIKit

import TNCore

final class SelectUsersCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = SelectUsersServiceMock()
        let viewModel = SelectUsersViewModelImpl(service: service)
        let viewController = SelectUsersViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
