//
//  RecipeMapper.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

import Foundation
struct RecipeMapper {
    static func toLocal(type: Recipe ) -> CacheRecipe {
        return CacheRecipe(
            name: type.name,
            ingredients: type.ingredients,
            instructions: type.instructions,
            serving: type.serving
        )
    }
    static func fromLocal(type: CacheRecipe) -> Recipe {
        return Recipe(
            id: type.id,
            name: type.name,
            ingredients: type.ingredients,
            instructions: type.instructions,
            serving: type.serving
        )
    }
}
