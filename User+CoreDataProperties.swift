//
//  User+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 3/4/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var cart: NSSet?
    @NSManaged public var products: NSSet?
    @NSManaged public var orderHistory: NSSet?

    public var productsList: [Product] {
        let productsSet = products as? Set<Product> ?? []
        return Array(productsSet).sorted { lhs, rhs in
            lhs.name! < rhs.name!
        }
    }
    
    public var productsCount: Int {
        return productsList.count
    }
    
    public var cartList: [Product] {
        let cartSet = cart as? Set<Product> ?? []
        return Array(cartSet).sorted { lhs, rhs in
            lhs.name! < rhs.name!
        }
    }
    
    public var cartCount: Int {
        return cartList.count
    }
    
    public var orderHistoryList: [Product] {
        let historySet = orderHistory as? Set<Product> ?? []
        return Array(historySet).sorted { lhs, rhs in
            lhs.name! < rhs.name!
        }
    }
    
    public var orderHistoryCount: Int {
        return orderHistoryList.count
    }
}

// MARK: Generated accessors for cart
extension User {

    @objc(addCartObject:)
    @NSManaged public func addToCart(_ value: Product)

    @objc(removeCartObject:)
    @NSManaged public func removeFromCart(_ value: Product)

    @objc(addCart:)
    @NSManaged public func addToCart(_ values: NSSet)

    @objc(removeCart:)
    @NSManaged public func removeFromCart(_ values: NSSet)

}

// MARK: Generated accessors for products
extension User {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

// MARK: Generated accessors for orderHistory
extension User {

    @objc(addOrderHistoryObject:)
    @NSManaged public func addToOrderHistory(_ value: Product)

    @objc(removeOrderHistoryObject:)
    @NSManaged public func removeFromOrderHistory(_ value: Product)

    @objc(addOrderHistory:)
    @NSManaged public func addToOrderHistory(_ values: NSSet)

    @objc(removeOrderHistory:)
    @NSManaged public func removeFromOrderHistory(_ values: NSSet)

}

extension User : Identifiable {

}
