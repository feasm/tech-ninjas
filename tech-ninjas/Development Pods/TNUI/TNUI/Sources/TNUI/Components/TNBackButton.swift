//
//  File.swift
//  
//
//  Created by Gustavo Minatti on 16/09/22.
//

import UIKit

import TNCore

public class TNBackButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TNBackButton: ViewCoded {
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        
    }
    
    public func addAdditionalConfiguration() {
        
    }
}
