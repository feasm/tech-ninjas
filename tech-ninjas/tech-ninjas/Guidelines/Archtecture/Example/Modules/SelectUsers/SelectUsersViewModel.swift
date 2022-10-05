// 
//  SelectUsersViewModel.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

protocol SelectUsersViewModel {
    var filteredUserModels: [UserModel] { get }
    
    var didUpdateUsers: (() -> Void)? { get set }
    
    func getUsers()
    func filterUsers(text: String)
    func selectUser(index: Int, isSelected: Bool)
    
    func didTapSelectButton()
}

final class SelectUsersViewModelImpl: SelectUsersViewModel {
    
    private let service: SelectUsersService
    private var userModels = [UserModel]()
    
    var filteredUserModels = [UserModel]()
    
    var didUpdateUsers: (() -> Void)?
    
    init(service: SelectUsersService) {
        self.service = service
    }
    
    func getUsers() {
        service.getUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let userModels):
                self.userModels = userModels
                self.filteredUserModels = userModels
                
                self.didUpdateUsers?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func filterUsers(text: String) {
        filteredUserModels = text.isEmpty ? self.userModels : self.userModels.filter({ $0.name.contains(text) })
        
        didUpdateUsers?()
    }
    
    func selectUser(index: Int, isSelected: Bool) {
        userModels[index].isSelected = isSelected
    }
    
    func didTapSelectButton() {
        userModels.forEach { userModel in
            if userModel.isSelected {
                print("\(userModel.name) foi selecionado!")
            }
        }
    }
    
}
