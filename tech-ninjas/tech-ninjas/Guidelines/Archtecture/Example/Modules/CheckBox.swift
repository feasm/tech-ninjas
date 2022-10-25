//
//  CheckBox.swift
//  tech-ninjas
//
//  Created by Gustavo Minatti on 14/10/22.
//

import UIKit
import SwiftUI
import TNCore
import TNUI

public class CheckBox: UIButton {
    
    public enum IconCode: String {
        case checked = "\u{E834}"
        case unchecked = "\u{E835}"
        
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    //MARK: - Methods
    func configure() {
        setupCheckBox(title: currentTitle)
        addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        setupCheckBox(title: title)
    }
    
    func setupCheckBox(title: String?) {
        setupState(.normal, title: title, textColor: .black, iconCode: .unchecked, iconColor: .black)
        setupState(.selected, title: title, textColor: .black, iconCode: .checked, iconColor: .blue)
        setupState([.normal, .disabled], title: title, textColor: .gray, iconCode: .unchecked, iconColor: .gray)
        setupState([.selected, .disabled], title: title, textColor: .gray, iconCode: .checked, iconColor: .gray)
    }
    
    private func setupState(_ state: UIControl.State, title: String?, textColor: UIColor, iconCode: IconCode, iconColor: UIColor) {
        let attText = NSMutableAttributedString(string: iconCode.rawValue, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.kern: 10, NSAttributedString.Key.foregroundColor: iconColor, NSAttributedString.Key.baselineOffset: 2])
        
        attText.append(NSMutableAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.baselineOffset: 1]))
        
        setAttributedTitle(attText, for: state)
    }
    
    //MARK: - Selectors
    @objc func clickAction(_ sender: UIButton) {
        isSelected = !isSelected
    }
    
}
