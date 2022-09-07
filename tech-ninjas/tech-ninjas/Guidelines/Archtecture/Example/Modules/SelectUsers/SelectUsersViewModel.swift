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

struct SelectUsersViewModelInput {
    var searchText: Observable<String?>
}

struct SelectUsersViewModelOutput {
    var users: Driver<[UserModel]>
}

protocol SelectUsersViewModel {
    var output: SelectUsersViewModelOutput { get }
    
    func setup(_ input: SelectUsersViewModelInput)
    func getUsers()
}

final class SelectUsersViewModelImpl: SelectUsersViewModel {
    
    var input: SelectUsersViewModelInput?
    var output: SelectUsersViewModelOutput
    
    private let service: SelectUsersService
    private let disposeBag = DisposeBag()
    
    private var users = [UserModel]() {
        didSet {
            updateUsers.onNext(users)
        }
    }
    private var updateUsers = PublishSubject<[UserModel]>()
    
    init(service: SelectUsersService) {
        self.service = service
        
        output = SelectUsersViewModelOutput(
            users: updateUsers.asDriver(onErrorJustReturn: [])
        )
    }
    
    func setup(_ input: SelectUsersViewModelInput) {
        self.input = input
        
        input
            .searchText
            .compactMap({ $0 })
            .subscribe(onNext: { [weak self] searchText in
                guard let self = self else { return }
                
                let filteredUsers =
                    searchText.isEmpty ?
                    self.users : self.users.filter({ $0.name.contains(searchText) })
                
                self.updateUsers.onNext(filteredUsers)
            })
            .disposed(by: disposeBag)
    }
    
    func getUsers() {
        service
            .getUsers()
            .subscribe { [weak self] userModels in
                self?.users = userModels
            } onFailure: { error in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
}

struct UserModel: Decodable {
    let name: String
    let description: String
}

protocol SelectUsersService {
    func getUsers() -> Single<[UserModel]>
}

final class SelectUsersServiceImpl: SelectUsersService {
    
    func getUsers() -> Single<[UserModel]> {
        // buscar do mongoDB
        return .just([])
    }
    
}

final class SelectUsersServiceMock: SelectUsersService {
    
    func getUsers() -> Single<[UserModel]> {
        return .just([
            .init(name: "Carlinhos", description: "Pai do carlinhozinho"),
            .init(name: "Minatti", description: "Pai do toddy"),
            .init(name: "Po", description: "Pai do futuro"),
            .init(name: "Carlinhozinho", description: "Filho do carlinhos"),
            .init(name: "Toddy", description: "Filho do minatti"),
            .init(name: "Futuro", description: "Filho do paulo")
        ])
    }
    
}
