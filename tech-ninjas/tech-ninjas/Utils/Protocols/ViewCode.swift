//
//  ViewCode.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 25/10/22.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func addAdditionalConfiguration()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        addAdditionalConfiguration()
    }
}
