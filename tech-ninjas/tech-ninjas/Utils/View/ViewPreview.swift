//
//  ViewController.swift
//  mvvm example
//
//  Created by Paulo Lazarini on 24/10/22.
//

import Foundation
import UIKit
import SwiftUI

struct ViewPreview: UIViewRepresentable  {
    let viewBuilder: () -> UIView
    
    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }
    
    func makeUIView(context: Context) -> some UIView {
        return viewBuilder()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
