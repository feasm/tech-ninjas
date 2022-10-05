// ___FILEHEADER___

import UIKit

import TNCore
import TNUI

protocol ___VARIABLE_screenName:identifier___ViewModel {
    func getUsers()
}

final class ___VARIABLE_screenName:identifier___ViewModelImpl: ___VARIABLE_screenName:identifier___ViewModel {

    private let service: ___VARIABLE_screenName:identifier___Service
    private var userModels = [___VARIABLE_screenName:identifier___Model]()
    
    init(service: ___VARIABLE_screenName:identifier___Service) {
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
