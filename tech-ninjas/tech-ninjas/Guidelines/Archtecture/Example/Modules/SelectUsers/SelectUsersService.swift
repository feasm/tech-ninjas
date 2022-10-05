//
//  SelectUsersService.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 05/10/22.
//

import Foundation

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
            .init(id: 0, name: "Carlinhos", description: "Pai do carlinhozinho"),
            .init(id: 1, name: "Minatti", description: "Pai do toddy"),
            .init(id: 2, name: "Po", description: "Pai do futuro"),
            .init(id: 3, name: "Carlinhozinho", description: "Filho do carlinhos"),
            .init(id: 4, name: "Toddy", description: "Filho do minatti"),
            .init(id: 5, name: "Futuro", description: "Filho do paulo")
        ]))
    }
    
}
