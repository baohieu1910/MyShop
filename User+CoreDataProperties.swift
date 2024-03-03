//
//  User+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
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
    @NSManaged public var products: NSSet?

    public var productsList: [Product] {
        let productsSet = products as? Set<Product> ?? []
        
        return Array(productsSet)
    }
    
    public var productsCount: Int {
        return productsList.count
    }
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

extension User : Identifiable {

}
