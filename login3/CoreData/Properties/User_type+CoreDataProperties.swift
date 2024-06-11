//
//  User_type+CoreDataProperties.swift
//  login3
//
//  Created by Piotr Plewka on 11/06/2024.
//
//

import Foundation
import CoreData


extension User_type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User_type> {
        return NSFetchRequest<User_type>(entityName: "User_type")
    }

    @NSManaged public var iduser_type: Int32
    @NSManaged public var name_type: String?
    @NSManaged public var toUser: User?

}

extension User_type : Identifiable {

}
