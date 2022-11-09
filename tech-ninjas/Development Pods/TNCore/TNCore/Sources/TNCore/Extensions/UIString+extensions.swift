//
//  UIString+extensions.swift
//  
//
//  Created by Gustavo Minatti on 06/10/22.
//

import UIKit

extension String {
    func validateName() -> Bool {
        let nameRegex = "^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return predicate.evaluate(with: self)
    }
}
