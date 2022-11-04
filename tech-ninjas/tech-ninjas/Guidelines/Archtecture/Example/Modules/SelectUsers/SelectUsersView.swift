// 
//  SelectUsersView.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class SelectUsersView: UIView {
    
    private struct Constants {
        static let margin: CGFloat = 24
    }
    
    lazy var searchTextField: TNTextField = {
        let textField = TNTextField()
        textField.placeholder = "Enter text..."
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    lazy var selectButton: TNPrimaryButton = {
        let button = TNPrimaryButton()
        button.setTitle("Select", for: .normal)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SelectUsersView: ViewCoded {
    func buildViewHierarchy() {
        addSubview(searchTextField)
        addSubview(tableView)
        addSubview(selectButton)
    }
    
    func setupConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(Constants.margin)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.trailing.equalToSuperview().inset(Constants.margin)
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        selectButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.margin)
            make.trailing.equalToSuperview().inset(Constants.margin)
            make.bottom.equalToSuperview().inset(Constants.margin)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}

//struct SelectUsersView_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPreview {
//            SelectUsersView()
//        }
//    }
//}
