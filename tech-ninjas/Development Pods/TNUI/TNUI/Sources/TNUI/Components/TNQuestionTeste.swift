//
//  TNQuestionTeste.swift
//  TNUI
//
//  Created by Gustavo Minatti on 14/10/22.
//

import UIKit
import TNCore

public class TNQuestionTeste: UIButton {
    
    public func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributeTitle = NSMutableAttributedString(string: firstPart, attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
        
        attributeTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSMutableAttributedString.Key.foregroundColor: UIColor.primaryBlue]))
        
        button.setAttributedTitle(attributeTitle, for: .normal)
        
        return button
    }
    
}
