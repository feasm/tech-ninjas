//
//  ViewController.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 03/09/22.
//

import UIKit

class ViewModel {
    
}

class ViewController: UIViewController {
    
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        // ...
    }
    
}

protocol Service {
    func getProducts()
}
