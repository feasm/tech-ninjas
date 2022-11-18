//
//  TelephoneInputService.swift
//  tech-ninjas
//
//  Created by Paulo Lazarini on 10/11/22.
//

import Foundation

enum TelephoneInputNetworkError: Error {
    case internalServerError
}

protocol TelephoneInputService {
    func getUsers(completion: @escaping (Result<[TelephoneInputModel], TelephoneInputNetworkError>) -> Void)
}

final class TelephoneInputServiceImpl: TelephoneInputService {
    
    func getUsers(completion: @escaping (Result<[TelephoneInputModel], TelephoneInputNetworkError>) -> Void) {
        
    }
    
}

final class TelephoneInputServiceMock: TelephoneInputService {
    
    func getUsers(completion: @escaping (Result<[TelephoneInputModel], TelephoneInputNetworkError>) -> Void) {
        completion(.success(
            [] //sugestion
        ))
    }
    
}
