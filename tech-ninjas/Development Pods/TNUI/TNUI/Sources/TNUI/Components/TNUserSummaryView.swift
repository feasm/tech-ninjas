//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit
import SnapKit

import TNCore

public protocol TNUserSummaryViewDelegate {
    func didUpdateSwitch(index: Int, value: Bool)
}

public class TNUserSummaryView: UIView {
    
    struct Constants {
        static let height: CGFloat = 86
        static let margin: CGFloat = 18
        
        struct UserImageView {

        }
    }
    
    lazy public var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user_avatar")
        
        return imageView
    }()
    
    lazy public var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.font = TNFonts.verySmallFontBold
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        label.font = TNFonts.verySmallFont
        
        return label
    }()
    
    lazy var selectSwitch: TNSwitch = {
        let selectSwitch = TNSwitch()
        
        return selectSwitch
    }()
    
    public var delegate: TNUserSummaryViewDelegate?
    
    private var index: Int = 0
    
    public init() {
        super.init(frame: .zero)
        setupView()
        setupBindings()
    }
    
    public func setup(title: String, description: String, index: Int) {
        titleLabel.text = title
        descriptionLabel.text = description
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBindings() {
        selectSwitch.addTarget(self, action: #selector(didUpdateSwitch), for: .valueChanged)
    }
    
    @objc private func didUpdateSwitch() {
        delegate?.didUpdateSwitch(index: index, value: selectSwitch.isOn)
    }
    
}

extension TNUserSummaryView: ViewCoded {
    public func buildViewHierarchy() {
        addSubview(userImageView)
        addSubview(textStackView)
        addSubview(selectSwitch)
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }

        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.margin)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.bottom.equalToSuperview().inset(Constants.margin)
            make.width.equalTo(userImageView.snp.height)
        }

        textStackView.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView.snp.centerY)
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
        }

        selectSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.margin)
            make.centerY.equalTo(userImageView.snp.centerY)
        }
    }
    
    public func addAdditionalConfiguration() {
//        backgroundColor = .gray
    }
}
