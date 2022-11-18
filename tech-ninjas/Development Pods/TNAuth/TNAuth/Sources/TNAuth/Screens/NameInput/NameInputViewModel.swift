//
//  NameInputViewModel.swift
//  tech-ninjas
//
//  Created by Paulo Lazarini on 10/11/22.
//


protocol NameInputViewModel {
    func getUsers()
    func validateNameInput(name: String)
    func showLoginScreen()
}

final class NameInputViewModelImpl: NameInputViewModel {
    
    private let coordinator: TNAuthCoordinator
    private let service: NameInputService
    private var userModels = [NameInputModel]()
    
    init(service: NameInputService, coordinator: TNAuthCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func validateNameInput(name: String) {
        if name.validateName() == true {
            print("deu certo")
            coordinator.showTelephoneInput()
        }else {
            print("Errado")
        }
    }
    
    func showTelephoneInput() {
        coordinator.showTelephoneInput()
    }
    
    func showLoginScreen() {
        coordinator.start()
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


