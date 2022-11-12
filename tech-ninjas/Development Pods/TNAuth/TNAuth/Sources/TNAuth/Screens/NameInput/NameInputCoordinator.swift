//
//  NameInputCoordinator.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 28/10/22.
//

import Foundation
import UIKit

import TNCore

public final class NameInputCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let service = NameInputServiceMock()
        let viewModel = NameInputViewModelImpl(service: service)
        let viewController = NameInputViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.isNavigationBarHidden = true
        currentViewController = viewController
    }
}
