//
//  UserSummaryViewCell.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 05/10/22.
//

import UIKit
import SnapKit

import TNCore
import TNUI

class UserSummaryViewCell: UITableViewCell {
    
    lazy var userSummaryView: TNUserSummaryView = {
        let view = TNUserSummaryView()
        
        return view
    }()
    
    func setup(_ userModel: UserModel, index: Int) {
        userSummaryView.setup(title: userModel.name, description: userModel.description, index: index)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserSummaryViewCell: ViewCoded {
    func buildViewHierarchy() {
        contentView.addSubview(userSummaryView)
    }
    
    func setupConstraints() {
        userSummaryView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
        
    }
}
