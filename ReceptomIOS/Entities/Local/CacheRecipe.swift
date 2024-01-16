//
//  CacheRecipe.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

import Foundation
import SwiftData

@Model
class CacheRecipe {
    var id: UUID?
     var name: String
     var ingredients: String
     var instructions: String
     var serving: Int
     
     init(name: String, ingredients: String, instructions: String, serving: Int) {
         self.name = name
         self.ingredients = ingredients
         self.instructions = instructions
         self.serving = serving
     }
 }
