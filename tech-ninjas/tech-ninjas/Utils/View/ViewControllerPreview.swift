//
//  ViewControllerPreview.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 24/10/22.
//

import Foundation
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable  {
    let viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
