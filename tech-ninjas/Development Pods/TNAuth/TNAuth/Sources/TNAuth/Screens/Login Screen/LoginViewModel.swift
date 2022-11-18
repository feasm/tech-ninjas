// 
//  LoginViewModel.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import UIKit

import TNCore
import TNUI

protocol LoginViewModel {
    func getUsers()
    func showNameInput()
}

final class LoginViewModelImpl: LoginViewModel {

    private let service: LoginService
    private let coordinator: TNAuthCoordinator
    private var userModels = [LoginModel]()
    
    init(service: LoginService, coordinator: TNAuthCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func showNameInput() {
        coordinator.showNameInput()
    }
    
    func getUsers() {
        service.getUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let userModels):
                self.userModels = userModels

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
