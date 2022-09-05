

import UIKit
import RxSwift
import RxCocoa

import TNCore
import TNUI

class NoOneView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NoOneView: ViewCoded {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func addAdditionalConfiguration() {
        
    }
}
