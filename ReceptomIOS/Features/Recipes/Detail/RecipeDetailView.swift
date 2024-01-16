//
//  RecipeDetailView.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 3/1/24.
//

import SwiftUI
import SlidingTabView
struct RecipeDetailView: View {
    private var idRecipe: UUID
    @State private var showingDeleteAlert = false
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var recipeViewModel: RecipeViewModel
    @State private var tabIndex = 0
    @EnvironmentObject var coordinator: Coordinator
    
    init(recipeViewModel: RecipeViewModel, idRecipe: UUID) {
        _recipeViewModel = StateObject(wrappedValue: recipeViewModel)
        self.idRecipe = idRecipe
    }
    
    var body: some View {
        VStack() {
            Image("iv_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
            
            Text(recipeViewModel.recipe.name)
                .font(.title)
                .fontWeight(.bold)
            
            VStack {
                SlidingTabView(selection: $tabIndex,
                               tabs: ["Ingredientes", "Preparación","Cantidad"],
                               activeAccentColor: .orange,
                               
                               selectionBarColor: .orange ).accentColor(.orange)
            }

            if tabIndex == 0 {
                ScrollView {
                    VStack(spacing: 8) {
                        Text("Ingredientes").font(.title)
                        Text("Lista de ingredientes:").font(.subheadline)
                        let ingredientsArray = recipeViewModel.recipe.ingredients.components(separatedBy: ",")
                        ForEach(ingredientsArray, id: \.self) { ingredient in
                           let detailedIngredients = ingredient.components(separatedBy: "\n")
                           ForEach(detailedIngredients, id: \.self) { detailedIngredient in
                               Text(detailedIngredient)
                           }
                       }
                    }.padding(10)
                }
            } else if tabIndex == 1 {
                ScrollView {
                    VStack(spacing: 8) {
                        Text("Instrucciones").font(.title)
                        Text("Pasos para preparar la receta:").font(.subheadline)
                        Text(recipeViewModel.recipe.instructions)
                    }.padding(10)
                }
            } else if tabIndex == 2 {
                ScrollView {
                    VStack(spacing: 8) {
                        Text("Cantidad").font(.title)
                        Text("Número de personas recomendado:").font(.subheadline)
                        Text("\(recipeViewModel.recipe.serving) personas")
                    }.padding(10)
                }
            }
            Spacer()
        }
        .navigationBarItems(trailing:
            HStack {
                Button(action: {
                    showingDeleteAlert = true
                }) {
                    Image(systemName: "trash").foregroundColor(.black)
                }
            }
        )
        .alert(isPresented: $showingDeleteAlert) {
                Alert(
                    title: Text("¿Eliminar receta?"),
                    message: Text("¿Estás seguro de que quieres eliminar esta receta?"),
                    primaryButton: .destructive(Text("Sí")) {
                        Task {
                            do {
                                await recipeViewModel.fetchDeleteRecipes(recipe: recipeViewModel.recipe)
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    },
                    secondaryButton: .cancel(Text("No"))
                )
            }
        .onAppear {
            Task {
                do {
                    await recipeViewModel.fetchGetRecipes(idRecipe: idRecipe)
                }
            }
        }
        
    }
}
