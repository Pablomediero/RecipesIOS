//
//  ApiIngredient.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 5/1/24.
//

import Foundation
struct Ingredient: Codable {
    let id: Int
    let idRecipe: Int
    let name: String
}
