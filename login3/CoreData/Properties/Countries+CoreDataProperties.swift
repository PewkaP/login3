//
//  Countries+CoreDataProperties.swift
//  login3
//
//  Created by Piotr Plewka on 11/06/2024.
//
//

import Foundation
import CoreData


extension Countries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Countries> {
        return NSFetchRequest<Countries>(entityName: "Countries")
    }

    @NSManaged public var idcountry: Int32
    @NSManaged public var name_country: String?
    @NSManaged public var toCities: Cities?

}

extension Countries : Identifiable {

}
