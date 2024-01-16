//
//  RecipeRepository.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

import Foundation
struct RecipeRepository {
    private let localService: RecipeLocalService
    
    init(localService: RecipeLocalService) {
        self.localService = localService
    }
    
    func getAllRecipes() async throws -> [Recipe] {
        return try await localService.getAllRecipes()
    }
    
    func getRecipe(idRecipe: UUID) async throws -> Recipe {
        return try await localService.getRecipe(idRecipe: idRecipe)
    }
    
    func addRecipe(recipe: Recipe) async throws {
        try await localService.addRecipe(recipe: recipe)
    }
    
    func deleteRecipe(recipe: Recipe) async throws {
        try await localService.deleteRecipe(recipe: recipe)
    }
}
