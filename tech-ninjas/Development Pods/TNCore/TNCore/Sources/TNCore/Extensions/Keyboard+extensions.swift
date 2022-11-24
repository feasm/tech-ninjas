//
//  Keyboard+extensions.swift
//  TNCore
//
//  Created by Paulo Lazarini on 23/11/22.
//

//import UIKit
//
//public extension UIViewController {
//    
//    func configureObserver() {
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(handle(keyboardShowNotification:)),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
//        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(handle(keyboardHideNotification:)),
//                                               name: UIResponder.keyboardWillHideNotification,
//                                               object: nil)
//    }
//    
//    @objc func handle(keyboardShowNotification notification: Notification){
//        // 1
//        print("Keyboard show notification")
//        
//        // 2
//        if let userInfo = notification.userInfo,
//           // 3
//           let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
//            print(keyboardRectangle.height)
//            moveUp(keyboardHeight: Int(keyboardRectangle.height))
//        }
//    }
//    
//    func moveUp(keyboardHeight: Int) {
//        contentView.nextButton.snp.updateConstraints { make in
//            make.bottom.equalToSuperview().inset(keyboardHeight + 24)
//        }
//    }
//    
//    @objc func handle(keyboardHideNotification notification: Notification){
//        // 1
//        print("Keyboard show notification")
//        
//        // 2
//        if let userInfo = notification.userInfo,
//           // 3
//           let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
//            print(keyboardRectangle.height)
//            moveDown()
//        }
//    }
//    
//    func moveDown() {
//        contentView.nextButton.snp.updateConstraints { make in
//            make.bottom.equalToSuperview().inset(24)
//        }
//    }
//}
