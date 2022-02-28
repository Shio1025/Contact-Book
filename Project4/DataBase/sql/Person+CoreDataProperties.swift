//
//  Person+CoreDataProperties.swift
//  Project4
//
//  Created by shio birbichadze on 1/7/22.
//  Copyright © 2022 shio birbichadze. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var star: Bool
    @NSManaged public var surname: String?
    @NSManaged public var family: Family?
    @NSManaged public var favFamily: Family?

}
