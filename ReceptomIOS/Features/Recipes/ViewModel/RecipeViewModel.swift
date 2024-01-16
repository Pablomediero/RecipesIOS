//
//  RecipeViewModel.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 8/1/24.
//

import Foundation
class RecipeViewModel : ObservableObject {
    private let getAllRecipesUseCase : GetAllRecipesUseCase
    private let getRecipeUseUseCase: GetRecipeUseCase
    private let addRecipeUseCase: AddRecipeUseCase
    private let deleteRecipeUseCase: DeleteRecipeUseCase
    @Published var recipe = Recipe(id: nil, name: "", ingredients: "", instructions: "", serving: 0)
    @Published var recipeList: [Recipe] = []
    @Published var showErrorMessage = false
   
    init(getAllRecipesUseCase: GetAllRecipesUseCase, getRecipeUseUseCase: GetRecipeUseCase, addRecipeUseCase: AddRecipeUseCase, deleteRecipeUseCase: DeleteRecipeUseCase)  {
        self.getAllRecipesUseCase = getAllRecipesUseCase
        self.getRecipeUseUseCase = getRecipeUseUseCase
        self.addRecipeUseCase = addRecipeUseCase
        self.deleteRecipeUseCase = deleteRecipeUseCase
    }
    
    func fetchGetAllRecipes() async {
        do {
            recipeList = try await getAllRecipesUseCase.execute()
            
        }catch {
            showErrorMessage = true
        }
    }
    
    func fetchGetRecipes(idRecipe: UUID) async {
        do {
            recipe = try await getRecipeUseUseCase.execute(idRecipe: idRecipe)
        }catch {
            showErrorMessage = true
        }
    }
    
    func fetchAddRecipes(recipe: Recipe) async {
        do {
            try await addRecipeUseCase.execute(recipe: recipe)
        }catch {
            showErrorMessage = true
        }
    }
    
    func fetchDeleteRecipes(recipe: Recipe) async {
        do {
            try await deleteRecipeUseCase.execute(recipe: recipe)
        }catch {
            showErrorMessage = true
        }
    }
}
