// 
//  LoginCoordinator.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import Foundation
import UIKit

import TNCore

public final class TNAuthCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let service = LoginServiceMock()
        let viewModel = LoginViewModelImpl(service: service, coordinator: self)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.isNavigationBarHidden = true
        currentViewController = viewController
    }
    
    public func showNameInput() {
        let service = NameInputServiceMock()
        let viewModel = NameInputViewModelImpl(service: service, coordinator: self)
        let viewController = NameInputViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.isNavigationBarHidden = true
        currentViewController = viewController
    }
    
    public func showTelephoneInput() {
        let service = TelephoneInputServiceMock()
        let viewModel = TelephoneInputViewModelImpl(service: service, coordinator: self)
        let viewController = TelephoneInputViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.isNavigationBarHidden = true
        currentViewController = viewController
    }
}
