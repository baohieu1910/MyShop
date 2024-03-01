//
//  Product+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var imageName: String?
    @NSManaged public var price: Double
    @NSManaged public var isSold: Bool
    @NSManaged public var detail: String?
    @NSManaged public var user: User?

}

extension Product : Identifiable {

}
