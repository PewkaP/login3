//
//  Cities+CoreDataProperties.swift
//  login3
//
//  Created by Piotr Plewka on 11/06/2024.
//
//

import Foundation
import CoreData


extension Cities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cities> {
        return NSFetchRequest<Cities>(entityName: "Cities")
    }

    @NSManaged public var idcity: Int32
    @NSManaged public var city: String?
    @NSManaged public var fk_idcountry: Int32
    @NSManaged public var toCountries: Countries?
    @NSManaged public var toUser: User?

}

extension Cities : Identifiable {

}
