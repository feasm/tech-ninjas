//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit

public extension UIColor {
    static var primaryBlue: UIColor {
        UIColor(red: 30, green: 100, blue: 221)
    }
    
    static var lightBlue: UIColor {
        UIColor(red: 188, green: 209, blue: 246)
    }
    
    static var errorLabel: UIColor {
        UIColor(red: 222, green: 59, blue: 59)
    }
    
    static var errorTextField: UIColor {
        UIColor(red: 253, green: 242, blue: 242)
    }
    
    static var registerTextField: UIColor {
        UIColor(red: 243, green: 244, blue: 246)
    }

    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
