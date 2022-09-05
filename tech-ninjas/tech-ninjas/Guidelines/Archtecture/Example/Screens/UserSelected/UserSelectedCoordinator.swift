//
// 
//  UserSelectedCoordinator.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//
//

import Foundation
import UIKit

final class UserSelectedCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = UserSelectedViewModelImpl(input: UserSelectedViewModelInput())
        let viewController = UserSelectedViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
