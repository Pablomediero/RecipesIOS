//
//  AddRecipeUseCase.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

struct AddRecipeUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    
    func execute(recipe: Recipe) async throws {
        try await recipeRepository.addRecipe(recipe: recipe)
    }
}

