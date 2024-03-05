//
//  Utils.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import Foundation

enum Utils {
    static func addProductToCart(user: User, product: Product) {
        user.addToCart(product)
        CoreDataManager.shared.saveContext()
    }
    
    static func addToOderHistory(user: User, product: Product) {
        user.addToOrderHistory(product)
        CoreDataManager.shared.saveContext()
    }
    
    static func removeFromCart(user: User, product: Product) {
        user.removeFromCart(product)
        CoreDataManager.shared.saveContext()
    }
}
