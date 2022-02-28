//
//  Family+CoreDataProperties.swift
//  Project4
//
//  Created by shio birbichadze on 1/7/22.
//  Copyright © 2022 shio birbichadze. All rights reserved.
//
//

import Foundation
import CoreData


extension Family {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Family> {
        return NSFetchRequest<Family>(entityName: "Family")
    }

    @NSManaged public var surname: String?
    @NSManaged public var members: NSOrderedSet?
    @NSManaged public var favourites: NSOrderedSet?

}

// MARK: Generated accessors for members
extension Family {

    @objc(insertObject:inMembersAtIndex:)
    @NSManaged public func insertIntoMembers(_ value: Person, at idx: Int)

    @objc(removeObjectFromMembersAtIndex:)
    @NSManaged public func removeFromMembers(at idx: Int)

    @objc(insertMembers:atIndexes:)
    @NSManaged public func insertIntoMembers(_ values: [Person], at indexes: NSIndexSet)

    @objc(removeMembersAtIndexes:)
    @NSManaged public func removeFromMembers(at indexes: NSIndexSet)

    @objc(replaceObjectInMembersAtIndex:withObject:)
    @NSManaged public func replaceMembers(at idx: Int, with value: Person)

    @objc(replaceMembersAtIndexes:withMembers:)
    @NSManaged public func replaceMembers(at indexes: NSIndexSet, with values: [Person])

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: Person)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: Person)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSOrderedSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSOrderedSet)

}

// MARK: Generated accessors for favourites
extension Family {

    @objc(insertObject:inFavouritesAtIndex:)
    @NSManaged public func insertIntoFavourites(_ value: Person, at idx: Int)

    @objc(removeObjectFromFavouritesAtIndex:)
    @NSManaged public func removeFromFavourites(at idx: Int)

    @objc(insertFavourites:atIndexes:)
    @NSManaged public func insertIntoFavourites(_ values: [Person], at indexes: NSIndexSet)

    @objc(removeFavouritesAtIndexes:)
    @NSManaged public func removeFromFavourites(at indexes: NSIndexSet)

    @objc(replaceObjectInFavouritesAtIndex:withObject:)
    @NSManaged public func replaceFavourites(at idx: Int, with value: Person)

    @objc(replaceFavouritesAtIndexes:withFavourites:)
    @NSManaged public func replaceFavourites(at indexes: NSIndexSet, with values: [Person])

    @objc(addFavouritesObject:)
    @NSManaged public func addToFavourites(_ value: Person)

    @objc(removeFavouritesObject:)
    @NSManaged public func removeFromFavourites(_ value: Person)

    @objc(addFavourites:)
    @NSManaged public func addToFavourites(_ values: NSOrderedSet)

    @objc(removeFavourites:)
    @NSManaged public func removeFromFavourites(_ values: NSOrderedSet)

}
