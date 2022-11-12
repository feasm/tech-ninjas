//
//  TelephoneInputViewController.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 28/10/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class TelephoneInputViewController: UIViewController {
    
    var contentView: TelephoneInputView?
    
    
    override func loadView() {
        contentView = TelephoneInputView()
        view = contentView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}


