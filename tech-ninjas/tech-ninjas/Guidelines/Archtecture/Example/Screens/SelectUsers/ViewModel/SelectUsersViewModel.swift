//
// 
//  SelectUsersViewModel.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//
//

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

struct SelectUsersViewModelViewModelInput {
    
}

struct SelectUsersViewModelViewModelOutput {
    
}

protocol SelectUsersViewModelViewModel {
    var input: SelectUsersViewModelViewModelInput { get }
    var output: SelectUsersViewModelViewModelOutput? { get }
}

final class SelectUsersViewModelViewModelImpl: SelectUsersViewModelViewModel {
    
    var input: SelectUsersViewModelViewModelInput
    var output: SelectUsersViewModelViewModelOutput?
    
    let disposeBag = DisposeBag()
    
    init(input: SelectUsersViewModelViewModelInput) {
        self.input = input
    }
    
}
