// 
//  SelectUsersModel.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import Foundation

struct UserModel: Decodable {
    let id: Int
    let name: String
    let description: String
    
    var isSelected: Bool = false
}
