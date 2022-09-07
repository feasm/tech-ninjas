// ___FILEHEADER___

import Foundation
import UIKit

import TNCore

final class ___VARIABLE_screenName:identifier___Coordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ___VARIABLE_screenName:identifier___ViewModelImpl()
        let viewController = ___VARIABLE_screenName:identifier___ViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
    
}
