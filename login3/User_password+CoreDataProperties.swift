//
//  User_password+CoreDataProperties.swift
//  login3
//
//  Created by Piotr Plewka on 04/06/2024.
//
//

import Foundation
import CoreData


extension User_password {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User_password> {
        return NSFetchRequest<User_password>(entityName: "User_password")
    }

    @NSManaged public var password_valid: Bool
    @NSManaged public var password_hashed: String?
    @NSManaged public var password_changed_date: Date?
    @NSManaged public var iduser_password: Int32
    @NSManaged public var fk_iduser: Int32
    @NSManaged public var toUser: User?

}

extension User_password : Identifiable {

}
