//
//  FeatureCoordinator.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import Foundation
import UIKit

// RxSwift
// SwiftLint
// SnapKit
// Firebase -> Analytics -> RemoteConfig -> Deploy
// MongoDB -> Dados
// Moya -> Network layer

// Module -> Features -> Conjunto de telas que entregam juntas um valor -> Independentes
// Shares libraries -> São códigos que precisarão ser executados em todo o projeto
// TNUI -> Componentes e definições de layout
// TNCore -> Formatação de data, máscara de input, Coordinator, ViewCode
// TNAnalytics -> Facade que implementa o FirebaseAnalytics
// TNNetworking -> Facade pro Moya

protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    func start()
}

final class HomeFeatureCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = HomeViewController(coordinator: self)
        navigationController = UINavigationController(rootViewController: viewController)
        currentViewController = viewController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

extension HomeFeatureCoordinator: HomeCoordinator {
    func showSelectUsers() {
        let coordinator = SelectUsersCoordinator(navigationController: navigationController)
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
