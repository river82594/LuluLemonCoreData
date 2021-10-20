//
//  CamachoLuluLemonTests.swift
//  CamachoLuluLemonTests
//
//  Created by River Camacho on 10/18/21.
//

import XCTest
import CoreData
@testable import LuluLemon
class CamachoLuluLemonTests: XCTestCase {
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    func testListVMFetchAndSaveData() {
        let sortVM = SortedListsVM()
        let addVM = AddItemVM()
        var originalCount = 0
        sortVM.fetchDataFromDb(sortIndex: 1)
        originalCount = sortVM.clothing.count
        addVM.saveDataToDB(name: "testItem")
        sortVM.fetchDataFromDb(sortIndex: 1)
        XCTAssertEqual(sortVM.getItemName(index: originalCount), "testItem")
    }
    func testListVMGetCount() {
        let sortVM = SortedListsVM()
        sortVM.clothing = [ClothingSelection(), ClothingSelection()]
        XCTAssertEqual(sortVM.getItemCount(), 2)
    }

}
