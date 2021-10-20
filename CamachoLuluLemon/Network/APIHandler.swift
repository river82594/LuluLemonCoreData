//
//  APIHandler.swift
//  LuluLemon
//
//  Created by River Camacho on 10/18/21.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    private init(){}
    
    let db = DBManager.shared
    
    func fetchDataFromCoreDB(sort: NSSortDescriptor, completionHandler: @escaping ([ClothingSelection])->()) {
        let clothing = db.fetchItems(sort: sort)
        completionHandler(clothing)
    }
    
    func saveItem(name: String) {
        db.saveItem(name: name)
    }
    
    func deleteItem(item: ClothingSelection) {
        db.deleteItem(item: item)
    }
}
