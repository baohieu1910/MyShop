//
//  ExampleData.swift
//  MyShop
//
//  Created by Hieu Le on 2/29/24.
//

import Foundation

enum ExampleData {
    static var user: User {
        var newUser = User(context: CoreDataManager.shared.viewContext)
        newUser.id = UUID()
        newUser.username = "BaoHieu"
        newUser.password = "123456"
        return newUser
    }
}
