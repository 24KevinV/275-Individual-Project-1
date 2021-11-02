//
//  ItemStore.swift
//  Ice Cream Tracker
//
//  Created by Kevin Veronneau on 11/2/21.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
//    init() {
//        for _ in 1...5 {
//            createItem()
//        }
//    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item()
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        
        allItems.insert(movedItem, at: toIndex)
    }
}
