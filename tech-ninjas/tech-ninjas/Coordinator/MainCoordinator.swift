//
//  MainCoordinator.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import Foundation
import UIKit

import TNCore
import TNAuth

final class MainCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationController: UINavigationController?
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
//        let viewController = LoginViewController()
        navigationController = UINavigationController()
        navigationController?.navigationBar.backgroundColor = .primaryBlue
        navigationController?.navigationBar.tintColor = .white
        
//        currentViewController = viewController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
//        let coordinator = LoginCoordinator(navigationController: navigationController)
        let coordinator = NameInputCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
}

// SwiftLint - Ok
// Firebase -> Analytics -> RemoteConfig -> Deploy - Ok
// MongoDB -> Dados - Ok
// Moya -> Network layer - Ok

// Module -> Features -> Conjunto de telas que entregam juntas um valor -> Independentes
// Shared libraries -> São códigos que precisarão ser executados em todo o projeto
// TNUI -> Componentes e definições de layout
// TNCore -> Formatação de data, máscara de input, Coordinator, ViewCode
// TNAnalytics -> Facade que implementa o GoogleTagManager
// TNNetworking -> Facade pro Moya
