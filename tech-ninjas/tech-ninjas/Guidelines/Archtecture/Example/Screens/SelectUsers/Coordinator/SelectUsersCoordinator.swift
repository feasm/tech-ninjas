//
// 
//  SelectUsersCoordinator.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//
//

import Foundation
import UIKit

final class SelectUsersCoordinatorCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SelectUsersCoordinatorViewModelImpl(input: SelectUsersCoordinatorViewModelInput())
        let viewController = SelectUsersCoordinatorViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
