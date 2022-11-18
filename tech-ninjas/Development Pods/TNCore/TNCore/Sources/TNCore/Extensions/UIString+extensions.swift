//
//  UIString+extensions.swift
//  
//
//  Created by Gustavo Minatti on 06/10/22.
//

import UIKit

public extension String {
    func validateName() -> Bool {
        let nameRegex = "^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return predicate.evaluate(with: self)
    }
    
    func validatePhoneNum(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    func formatMobileNumber() -> String {
        
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "(XX)XXXXX-XXXX"
        
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        var endIndex = cleanPhoneNumber.endIndex
        
        for charct in mask where startIndex < endIndex {
            
            if charct == "X" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(charct)
            }
        }
        
        return result
    }
}
