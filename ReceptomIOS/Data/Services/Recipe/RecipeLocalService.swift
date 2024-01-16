//
//  RecipeLocalService.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//
import Foundation
protocol RecipeLocalService {
    func getAllRecipes() async throws -> [Recipe]
    func getRecipe(idRecipe: UUID) async throws -> Recipe
    func addRecipe(recipe: Recipe) async throws
    func deleteRecipe(recipe: Recipe) async throws
}
