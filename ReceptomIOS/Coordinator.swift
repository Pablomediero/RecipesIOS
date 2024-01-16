//
//  Coordinator.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

import Foundation

class Coordinator: ObservableObject {
    private let chatgptRepository: ChatgptRepository
    private let recipeRepository: RecipeRepository
    private let getChatgptResponseUseCase: GetChatgptResponseUseCase
    private let getAllRecipesUseCase: GetAllRecipesUseCase
    private let getRecipeUseCase: GetRecipeUseCase
    private let addRecipeUseCase: AddRecipeUseCase
    private let deleteRecipeUseCase: DeleteRecipeUseCase
    private let liveChatgptRemoteService: LiveChatgptRemoteService
    private let liveRecipeLocalService: LiveRecipeLocalService
    
    init() {
          let networkClient = URLSessionNetworkClient()
          liveChatgptRemoteService = LiveChatgptRemoteService(networkClient: networkClient)
          liveRecipeLocalService = LiveRecipeLocalService()
          chatgptRepository = ChatgptRepository(remoteService: liveChatgptRemoteService)
          recipeRepository = RecipeRepository(localService: liveRecipeLocalService)
          getChatgptResponseUseCase = GetChatgptResponseUseCase(chatgptRepository: chatgptRepository)
          getAllRecipesUseCase = GetAllRecipesUseCase(recipeRepository: recipeRepository)
          getRecipeUseCase = GetRecipeUseCase(recipeRepository: recipeRepository)
          addRecipeUseCase = AddRecipeUseCase(recipeRepository: recipeRepository)
          deleteRecipeUseCase = DeleteRecipeUseCase(recipeRepository: recipeRepository)
      }
    
    func makeHomePageView() -> HomePageView {
        HomePageView()
    }
    
    func makeRecipeListView() -> RecipesListView {
        RecipesListView(recipeViewModel: makeRecipeViewModel())
    }
    
    func makeRecipeDetailView(with idRecipe: UUID) -> RecipeDetailView {
        RecipeDetailView(recipeViewModel: makeRecipeViewModel(), idRecipe: idRecipe)
    }
  
    func makeIngredientsListView() -> IngredientsListView {
        IngredientsListView(viewModel: makeChatgptViewModel())
    }
    
    func makeIngredientsDetailView(with ingredientsList: [String]) -> IngredientsDetailView {
            let chatgptViewModel = makeChatgptViewModel()
            let recipeViewModel = makeRecipeViewModel()
            return IngredientsDetailView(chatgptViewModel: chatgptViewModel, recipeViewModel: recipeViewModel, ingredientsList: ingredientsList)
        }
    
    private func makeChatgptViewModel() -> ChatgptViewModel {
        .init(getChatgptResponseUseCase: getChatgptResponseUseCase)
    }
    
    private func makeRecipeViewModel() -> RecipeViewModel {
        .init(getAllRecipesUseCase: getAllRecipesUseCase, getRecipeUseUseCase: getRecipeUseCase, addRecipeUseCase: addRecipeUseCase, deleteRecipeUseCase: deleteRecipeUseCase)
    }
}
