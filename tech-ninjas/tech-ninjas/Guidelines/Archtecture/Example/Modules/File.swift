////
////  File.swift
////  tech-ninjas
////
////  Created by Gustavo Minatti on 17/10/22.
////
//
//import UIKit
//import TNCore
//
//class TNCheckBox: UIView {
//
//    var nameIcon: String
//    var description: String
//
//    lazy var iconImageView: UIImageView = {
//        let icon = UIImageView()
//        icon.image = UIImage(named: nameIcon)
//
//        return icon
//    }()
//
//    lazy var descriptionLabel: UILabel = {
//        let text = UILabel()
//        text.text = description
//
//        return text
//    }()
//
//    //MARK: - Init
//    init(nameIcon: String, description: String) {
//        self.nameIcon = nameIcon
//        self.description = description
//
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}
//
//extension TNCheckBox: ViewCoded {
//    func buildViewHierarchy() {
//
//    }
//
//    func setupConstraints() {
//
//    }
//
//    func addAdditionalConfiguration() {
//
//    }
//
//
//}
