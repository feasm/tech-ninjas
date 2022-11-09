//
//  Coordinator.swift
//  TNCore
//
//  Created by Gustavo Minatti on 03/11/22.
//

import Foundation

public protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    func start()
}
