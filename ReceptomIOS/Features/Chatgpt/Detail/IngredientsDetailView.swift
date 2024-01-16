//
//  IngredientsDetailView.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 3/1/24.
//

import SwiftUI
struct IngredientsDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var chatgptViewModel: ChatgptViewModel
    @StateObject private var recipeViewModel: RecipeViewModel
    private var ingredientsList: [String]
    @State private var showingSaveAlert = false
    @State private var showingNextAlert = false
    @State private var isLoading = true
    init(chatgptViewModel: ChatgptViewModel, recipeViewModel: RecipeViewModel, ingredientsList: [String]) {
        _chatgptViewModel = StateObject(wrappedValue: chatgptViewModel)
        _recipeViewModel = StateObject(wrappedValue: recipeViewModel)
            self.ingredientsList = ingredientsList
        }
    
    
    var body: some View {
        VStack {
            Spacer()
                VStack {
                    if isLoading {
                        Spacer()
                        ProgressView()
                        Spacer()
                    } else {
                        VStack {
                            Text(chatgptViewModel.recipe.name)
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.white)
                                .border(Color.gray)
                                .cornerRadius(8)
                                .padding(.vertical, 32)
                        }
                        .frame(width: 500)
                        VStack() {
                            ScrollView {
                                Text("PREPARACION:")
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                Text(chatgptViewModel.recipe.instructions)
                                
                                Text("INGREDIENTES:")
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                Text(chatgptViewModel.recipe.ingredients)
                                
                                Text("CANTIDAD:")
                                    .fontWeight(.bold)
                                    .padding(.top, 8)
                                Text("\(chatgptViewModel.recipe.serving) Personas")
                            }
                            .padding(12)
                            .background(Color.white)
                            .border(Color.gray)
                            .cornerRadius(8)
                        }
                        .frame(width: 300, height: 350)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            showingNextAlert = true
                        }) {
                            Text("Siguiente")
                            Image(systemName: "arrow.right.circle.fill")
                        }
                        .padding()
                        .background(Color(.systemOrange))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                        .alert(isPresented: $showingNextAlert) {
                            Alert(
                                title: Text("Generar nueva receta"),
                                message: Text("¿Estás seguro de que quieres generar otra receta?"),
                                primaryButton: .default(Text("Sí")) {
                                    isLoading = true
                                    let order = Order(ingredients: ingredientsList, mode: false, recipeName: chatgptViewModel.recipe.name)
                                    Task {
                                        do {
                                            await chatgptViewModel.getChatgptResponse(order: order)
                                        }
                                    }
                                },
                                secondaryButton: .cancel(Text("No"))
                            )
                        }
                        Button(action: {
                            showingSaveAlert = true
                            let recipeToSave = Recipe(
                                name: chatgptViewModel.recipe.name,
                                ingredients: chatgptViewModel.recipe.ingredients,
                                instructions: chatgptViewModel.recipe.instructions,
                                serving: chatgptViewModel.recipe.serving)
                            Task {
                                do {
                                    await recipeViewModel.fetchAddRecipes(recipe: recipeToSave)
                                }
                            }
                        }) {
                            Text("Guardar")
                            Image(systemName: "square.and.arrow.down.fill")
                        }
                        .alert(isPresented: $showingSaveAlert) {
                            Alert(
                                title: Text("Receta Guardada"),
                                message: Text("Receta guardada satisfactoriamente"),
                                dismissButton: .default(Text("OK")) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            )
                        }
                        .padding()
                        .background(Color(.systemOrange))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    }
                    .padding(.bottom, 16)
                }
                
                .padding()
                .onAppear {
                    let order = Order(ingredients: ingredientsList, mode: true, recipeName: "")
                    Task {
                        do {
                            await chatgptViewModel.getChatgptResponse(order: order)
                            isLoading = false
                        }
                    }
                }
                .onChange(of: chatgptViewModel.recipe) { newValue in
                    isLoading = false
                }
                
            }
        
    }
}
