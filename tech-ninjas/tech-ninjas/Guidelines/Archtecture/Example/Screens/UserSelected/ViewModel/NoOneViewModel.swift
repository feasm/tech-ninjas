//
// 
//  NoOneViewModel.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 05/09/22.
//
//

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

struct NoOneViewModelInput {
    
}

struct NoOneViewModelOutput {
    
}

protocol NoOneViewModel {
    var input: NoOneViewModelInput { get }
    var output: NoOneViewModelOutput? { get }
}

final class NoOneViewModelImpl: NoOneViewModel {
    
    var input: NoOneViewModelInput
    var output: NoOneViewModelOutput?
    
    let disposeBag = DisposeBag()
    
    init(input: NoOneViewModelInput) {
        self.input = input
    }
    
}
