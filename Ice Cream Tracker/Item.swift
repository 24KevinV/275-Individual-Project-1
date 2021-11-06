//
//  Item.swift
//  Ice Cream Tracker
//
//  Created by Kevin Veronneau on 11/2/21.
//

import UIKit

class Item: Equatable, Codable {
    var name: String
    var town: String
    var rating: Int
    var notes: String
    let dateCreated: Date
    let itemKey: String
    
    init(name: String, town: String, rating: Int, notes: String) {
        self.name = name
        self.town = town
        self.rating = rating
        self.notes = notes
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
    }
    convenience init() {
        self.init(name: "New Shop", town: "Location", rating: 1, notes: "")
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.town == rhs.town
        && lhs.rating == rhs.rating
        && lhs.dateCreated == rhs.dateCreated
    }
}
