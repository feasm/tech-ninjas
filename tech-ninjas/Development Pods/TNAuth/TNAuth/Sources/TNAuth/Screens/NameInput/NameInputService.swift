//
//  NameInputService.swift
//  tech-ninjas
//
//  Created by Paulo Lazarini on 10/11/22.
//

import Foundation

enum NameInputNetworkError: Error {
    case internalServerError
}

protocol NameInputService {
    func getUsers(completion: @escaping (Result<[NameInputModel], NameInputNetworkError>) -> Void)
}

final class NameInputServiceImpl: NameInputService {
    
    func getUsers(completion: @escaping (Result<[NameInputModel], NameInputNetworkError>) -> Void) {
        
    }
    
}

final class NameInputServiceMock: NameInputService {
    
    func getUsers(completion: @escaping (Result<[NameInputModel], NameInputNetworkError>) -> Void) {
        completion(.success(
            [] //sugestion
        ))
    }
    
}
