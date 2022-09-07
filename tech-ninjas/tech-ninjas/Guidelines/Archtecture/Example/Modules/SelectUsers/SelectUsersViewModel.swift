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
    
}

struct SelectUsersViewModelOutput {
    
}

protocol SelectUsersViewModel {
    var input: SelectUsersViewModelInput? { get }
    var output: SelectUsersViewModelOutput? { get }
}

final class SelectUsersViewModelImpl: SelectUsersViewModel {
    
    var input: SelectUsersViewModelInput?
    var output: SelectUsersViewModelOutput?
    
    let disposeBag = DisposeBag()
    
    init() {
        
    }
    
}
