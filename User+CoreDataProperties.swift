//
//  User+CoreDataProperties.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var id: UUID?

}

extension User : Identifiable {

}
