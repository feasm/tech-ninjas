// 
//  RegisterNameViewModel.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 06/10/22.
//

import UIKit

import TNCore
import TNUI

protocol RegisterNameViewModel {
    func getUsers()
}

final class RegisterNameViewModelImpl: RegisterNameViewModel {

    private let service: RegisterNameService
    private var userModels = [RegisterNameModel]()
    
    init(service: RegisterNameService) {
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
