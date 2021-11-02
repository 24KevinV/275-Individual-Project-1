//
//  Item.swift
//  Ice Cream Tracker
//
//  Created by Kevin Veronneau on 11/2/21.
//

import UIKit

class Item: Equatable {
    var name: String
    var town: String
    var rating: Int
    let dateCreated: Date
    
    init(name: String, town: String, rating: Int) {
        self.name = name
        self.town = town
        self.rating = rating
        self.dateCreated = Date()
    }
    convenience init() {
        self.init(name: "Al's", town: "South Burlington \(Int.random(in: 1...15))", rating: Int.random(in: 1...15))
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.town == rhs.town
        && lhs.rating == rhs.rating
        && lhs.dateCreated == rhs.dateCreated
    }
}
