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
    
}

struct UserModel: Decodable {
    let name: String
    let description: String
}

enum NetworkError: Error {
    case internalServerError
}

protocol SelectUsersService {
    func getUsers(completion: @escaping (Result<[UserModel], NetworkError>) -> Void)
}

final class SelectUsersServiceImpl: SelectUsersService {
    
    func getUsers(completion: @escaping (Result<[UserModel], NetworkError>) -> Void) {
        
    }
    
}

final class SelectUsersServiceMock: SelectUsersService {
    
    func getUsers(completion: @escaping (Result<[UserModel], NetworkError>) -> Void) {
        completion(.success([
            .init(name: "Carlinhos", description: "Pai do carlinhozinho"),
            .init(name: "Minatti", description: "Pai do toddy"),
            .init(name: "Po", description: "Pai do futuro"),
            .init(name: "Carlinhozinho", description: "Filho do carlinhos"),
            .init(name: "Toddy", description: "Filho do minatti"),
            .init(name: "Futuro", description: "Filho do paulo")
        ]))
    }
    
}
