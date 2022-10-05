// 
//  RegisterNameService.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 06/10/22.
//

import Foundation

enum RegisterNameNetworkError: Error {
    case internalServerError
}

protocol RegisterNameService {
    func getUsers(completion: @escaping (Result<[RegisterNameModel], RegisterNameNetworkError>) -> Void)
}

final class RegisterNameServiceImpl: RegisterNameService {
    
    func getUsers(completion: @escaping (Result<[RegisterNameModel], RegisterNameNetworkError>) -> Void) {
        
    }
    
}

final class RegisterNameServiceMock: RegisterNameService {
    
    func getUsers(completion: @escaping (Result<[RegisterNameModel], RegisterNameNetworkError>) -> Void) {
//        completion(.success(
//            print([RegisterNameModel]) //sugestion
//        ))
    }
    
}
