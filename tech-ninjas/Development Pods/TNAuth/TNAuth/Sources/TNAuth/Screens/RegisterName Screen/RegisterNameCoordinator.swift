// 
//  RegisterNameCoordinator.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 06/10/22.
//

import Foundation
import UIKit

import TNCore

final class RegisterNameCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = RegisterNameServiceMock()
        let viewModel = RegisterNameViewModelImpl(service: service)
        let viewController = RegisterNameViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
