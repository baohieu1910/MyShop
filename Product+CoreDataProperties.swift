//
//  Product+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 3/6/24.
//
//

import Foundation
import CoreData
import SwiftUI

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
    @NSManaged public var sold: Int32
    @NSManaged public var date: Date?
    @NSManaged public var buyer: User?
    @NSManaged public var user: User?
    @NSManaged public var orderer: User?

    public var image: Image? {
        guard let imageData = imageData else {
            return nil
        }
        let uiImage = UIImage(data: imageData)
        guard let uiImage = uiImage else {
            return nil
        }
        return Image(uiImage: uiImage)
    }
    
    public func purchase(quantities: Int) {
        self.sold += Int32(quantities)
    }
    
    public func checkOutOfStock() -> Bool {
        return sold >= quantity
    }
}

extension Product : Identifiable {

}
