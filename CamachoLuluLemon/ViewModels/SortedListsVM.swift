//
//  SortedListsVM.swift
//  LuluLemon
//
//  Created by River Camacho on 10/18/21.
//

import Foundation
class SortedListsVM {
    var clothing: [ClothingSelection] = []
    let apiService = APIHandler.shared
    
    func fetchDataFromDb(sortIndex: Int) {
        // define sort rule
        var sort: NSSortDescriptor = NSSortDescriptor(key: "itemName", ascending: true)
        
        switch sortIndex {
        case 0:
            sort = NSSortDescriptor(key: "itemName", ascending: true)
        case 1:
            sort = NSSortDescriptor(key: "dateCreated", ascending: true)
        default:
            break
        }
        
        apiService.fetchDataFromCoreDB(sort: sort) { clothing in
            self.clothing = clothing
        }
    }
    func deleteItemFromDB(index: Int) {
        apiService.deleteItem(item: clothing[index])
    }
    func getItemCount() -> Int {
        return clothing.count
    }
    func getItemName(index: Int) -> String {
        return clothing[index].itemName ?? ""
    }
    
}
