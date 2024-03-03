//
//  Product+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
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
    @NSManaged public var isSold: Bool
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var user: User?

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
}

extension Product : Identifiable {

}
