//
//  ApiRecipe.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 5/1/24.
//

import Foundation
struct ApiRecipe: Codable {
    let id: Int
    let name: String
    let ingredients: [Ingredient]
    let instructions: String
    let serving: Int
}

