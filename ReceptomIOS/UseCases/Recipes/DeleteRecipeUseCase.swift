//
//  DeleteRecipeUseCase.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

struct DeleteRecipeUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    
    func execute(recipe: Recipe) async throws {
        try await recipeRepository.deleteRecipe(recipe: recipe)
    }
}
