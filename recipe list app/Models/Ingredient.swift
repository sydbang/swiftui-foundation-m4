//
//  Ingredient.swift
//  recipe list app
//
//  Created by Sunghee Bang on 2021-09-24.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    
    var name: String
    var num: Int?
    var denum: Int?
    var unit: String?
}
