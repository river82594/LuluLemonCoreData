//
//  SortedLists+CoreDataProperties.swift
//  LuluLemon
//
//  Created by River Camacho on 10/18/21.
//

import Foundation
import CoreData

extension ClothingSelection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClothingSelection> {
        return NSFetchRequest<ClothingSelection>(entityName: "ClothingSelection")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var dateCreated: Date?

}

extension ClothingSelection : Identifiable {

}
