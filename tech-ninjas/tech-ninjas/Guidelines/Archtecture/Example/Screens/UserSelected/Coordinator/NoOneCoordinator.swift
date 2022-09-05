//
// 
//  NoOneCoordinator.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 05/09/22.
//
//

import Foundation
import UIKit

final class NoOneCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = NoOneViewModelImpl(input: NoOneViewModelInput())
        let viewController = NoOneViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
