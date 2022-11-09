//
//  TNRegisterTextField.swift
//  
//
//  Created by Gustavo Minatti on 06/10/22.
//

import UIKit

public struct TNRegisterTextFieldParams {
    public let textPadding: UIEdgeInsets
    
    public init(textPadding: UIEdgeInsets = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )) {
        self.textPadding = textPadding
    }
}

public class TNRegisterTextField: UITextField {
    
    let params: TNRegisterTextFieldParams
    
    public init(params: TNRegisterTextFieldParams = TNRegisterTextFieldParams()) {
        self.params = params
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: params.textPadding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: params.textPadding)
    }

}
