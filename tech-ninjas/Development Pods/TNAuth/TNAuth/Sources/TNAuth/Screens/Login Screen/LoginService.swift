// 
//  LoginService.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 13/10/22.
//

import Foundation

enum LoginNetworkError: Error {
    case internalServerError
}

protocol LoginService {
    func getUsers(completion: @escaping (Result<[LoginModel], LoginNetworkError>) -> Void)
}

final class LoginServiceImpl: LoginService {
    
    func getUsers(completion: @escaping (Result<[LoginModel], LoginNetworkError>) -> Void) {
        
    }
    
}

final class LoginServiceMock: LoginService {
    
    func getUsers(completion: @escaping (Result<[LoginModel], LoginNetworkError>) -> Void) {
        completion(.success(
            [] //sugestion
        ))
    }
    
}