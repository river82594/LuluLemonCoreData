//
//  DataBaseManager.swift
//  LuluLemon
//
//  Created by River Camacho on 10/18/21.
//

import Foundation
import CoreData
import UIKit

class DBManager {
    static let shared = DBManager()
    private init(){}
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchItems(sort: NSSortDescriptor) -> [ClothingSelection] {
        var clothing: [ClothingSelection] = []
        // Fetch the data from Core Data to display in the tableView
        do {
            let request = ClothingSelection.fetchRequest() as NSFetchRequest<ClothingSelection>
            request.sortDescriptors = [sort]
            clothing = try self.context.fetch(request)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return clothing
    }
    func saveItem(name: String) {
        // Create a garment object
        let newGarment = ClothingSelection(context: self.context)
        newGarment.itemName = name
        newGarment.dateCreated = Date()

        // Save the data
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func deleteItem(item: ClothingSelection) {
        // Remove the garment
        self.context.delete(item)

        // Save the data
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
