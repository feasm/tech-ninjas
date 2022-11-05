// 
//  LoginCoordinator.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import Foundation
import UIKit

import TNCore

public final class LoginCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let service = LoginServiceMock()
        let viewModel = LoginViewModelImpl(service: service)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.isNavigationBarHidden = true
        currentViewController = viewController
    }
    
}
