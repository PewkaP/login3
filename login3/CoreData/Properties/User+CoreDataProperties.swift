//
//  User+CoreDataProperties.swift
//  login3
//
//  Created by Piotr Plewka on 04/06/2024.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var iduser: Int32
    @NSManaged public var name: String?
    @NSManaged public var lastname: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var street: String?
    @NSManaged public var phonenumber: Int64
    @NSManaged public var fk_iduser_type: Int32
    @NSManaged public var fk_idcity: Int32
    @NSManaged public var fk_idloyal_card: Int32
    @NSManaged public var email: String?
    @NSManaged public var toPass: User_password?

}

extension User : Identifiable {

}
