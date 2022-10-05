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
}

final class LoginViewModelImpl: LoginViewModel {

    private let service: LoginService
    private var userModels = [LoginModel]()
    
    init(service: LoginService) {
        self.service = service
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
