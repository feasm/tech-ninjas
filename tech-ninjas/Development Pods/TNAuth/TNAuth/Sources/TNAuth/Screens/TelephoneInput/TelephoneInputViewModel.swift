//
//  TelephoneInputViewModel.swift
//  tech-ninjas
//
//  Created by Paulo Lazarini on 10/11/22.
//

import UIKit

import TNCore
import TNUI


protocol TelephoneInputViewModel {
    func getUsers()
    func showNameInput()
    func maskMobileNumber(_ number:String) -> String
    func validateTelephoneInput(number: String)
}

final class TelephoneInputViewModelImpl: TelephoneInputViewModel {
    
    private let coordinator: TNAuthCoordinator
    private let service: TelephoneInputService
    private var userModels = [TelephoneInputModel]()
    
    init(service: TelephoneInputService, coordinator: TNAuthCoordinator) {
        self.service = service
        self.coordinator = coordinator
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
    
    func validateTelephoneInput(number: String) {
        if number.count == 14{
            print("deu certo")
        }else {
            print(number)
        }
    }
    
    func showNameInput() {
        coordinator.showNameInput()
    }
    
    func maskMobileNumber(_ number: String) -> String {
        var result = ""
        result = number.formatMobileNumber()
        return result
    }
    
}
