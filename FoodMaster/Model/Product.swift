//
//  Producy.swift
//  FoodMaster
//
//  Created by Erkebulan Massainov on 06.08.2024.
//

import SwiftUI

struct Product: Identifiable {
    var id : Int
    var name : String
    var rating: Double
    var image: String
    var price: Double
    var country: String
    var flag: String
    var discount: Bool
    var quantity: Int
    
    init(id: Int, name: String, rating: Double, image: String, price: Double, country: String = "", flag: String = "", discount: Bool = false, quantity: Int = 100) {
        self.id = id
        self.name = name
        self.rating = rating
        self.image = image
        self.price = price
        self.country = country
        self.flag = flag
        self.discount = discount
        self.quantity = quantity
    }
}

