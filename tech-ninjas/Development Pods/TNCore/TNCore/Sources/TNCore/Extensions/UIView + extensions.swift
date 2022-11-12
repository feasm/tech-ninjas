//
//  UIView + extensions.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 25/10/22.
//

import UIKit

public extension UIView {
    func setRounded() {
        layer.cornerRadius = 8
    }
    
    func setCircled() {
        layer.cornerRadius = (frame.height/2)
        clipsToBounds = true
    }
}
