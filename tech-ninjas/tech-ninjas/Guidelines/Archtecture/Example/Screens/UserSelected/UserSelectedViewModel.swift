//
// 
//  UserSelectedViewModel.swift
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

struct UserSelectedViewModelInput {
    
}

struct UserSelectedViewModelOutput {
    
}

protocol UserSelectedViewModel {
    var input: UserSelectedViewModelInput { get }
    var output: UserSelectedViewModelOutput? { get }
}

final class UserSelectedViewModelImpl: UserSelectedViewModel {
    
    var input: UserSelectedViewModelInput
    var output: UserSelectedViewModelOutput?
    
    let disposeBag = DisposeBag()
    
    init(input: UserSelectedViewModelInput) {
        self.input = input
    }
    
}
