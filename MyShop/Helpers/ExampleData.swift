//
//  ExampleData.swift
//  MyShop
//
//  Created by Hieu Le on 2/29/24.
//

import Foundation

enum ExampleData {
    static var user: User {
        let newUser = User(context: CoreDataManager.shared.viewContext)
        newUser.id = UUID()
        newUser.username = "BaoHieu"
        newUser.password = "123456"
        return newUser
    }
    
    static var product: Product {
        let newProduct = Product(context: CoreDataManager.shared.viewContext)
        newProduct.id = UUID()
        newProduct.name = "Giày Thể Thao New Balance 550 White Green BB550WT1 Màu Trắng Xanh Size 41.5"
        newProduct.detail = ""
        newProduct.imageData = nil
        newProduct.price = 350
        newProduct.quantity = 10
        return newProduct
    }
}
