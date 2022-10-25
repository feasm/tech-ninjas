// 
//  LoginCoordinator.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import Foundation
import UIKit

import TNCore

final class LoginCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = LoginServiceMock()
        let viewModel = LoginViewModelImpl(service: service)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
