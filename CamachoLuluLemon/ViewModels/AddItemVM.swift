//
//  AddItemVM.swift
//  LuluLemon
//
//  Created by River Camacho on 10/18/21.
//

import Foundation
class AddItemVM {
    let apiService = APIHandler.shared
    
    func saveDataToDB(name: String) {
        apiService.saveItem(name: name)
    }
    
}
