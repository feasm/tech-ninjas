//
//  NameInputViewModel.swift
//  tech-ninjas
//
//  Created by Paulo Lazarini on 10/11/22.
//

import UIKit

import TNCore
import TNUI

protocol NameInputViewModel {
    func getUsers()
}

final class NameInputViewModelImpl: NameInputViewModel {

    private let service: NameInputService
    private var userModels = [NameInputModel]()
    
    init(service: NameInputService) {
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
