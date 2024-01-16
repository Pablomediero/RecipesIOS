//
//  GetAllRecipesUseCase.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

struct GetAllRecipesUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    
    func execute() async throws -> [Recipe] {
        try await recipeRepository.getAllRecipes()
    }
}
