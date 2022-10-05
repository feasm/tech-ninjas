// ___FILEHEADER___

import Foundation

enum ___VARIABLE_screenName:identifier___NetworkError: Error {
    case internalServerError
}

protocol ___VARIABLE_screenName:identifier___Service {
    func getUsers(completion: @escaping (Result<[___VARIABLE_screenName:identifier___Model], NetworkError>) -> Void)
}

final class ___VARIABLE_screenName:identifier___ServiceImpl: ___VARIABLE_screenName:identifier___Service {
    
    func getUsers(completion: @escaping (Result<[___VARIABLE_screenName:identifier___Model], NetworkError>) -> Void) {
        
    }
    
}

final class ___VARIABLE_screenName:identifier___ServiceMock: ___VARIABLE_screenName:identifier___Service {
    
    func getUsers(completion: @escaping (Result<[___VARIABLE_screenName:identifier___Model], NetworkError>) -> Void) {
        completion(.success(
            [] //sugestion
        ))
    }
    
}
