//
//  Product+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var detail: String?
    @NSManaged public var id: UUID?
    @NSManaged public var imageData: Data?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int32
    @NSManaged public var user: User?
    @NSManaged public var buyer: User?

}

extension Product : Identifiable {

}
