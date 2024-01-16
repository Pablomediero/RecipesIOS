//
//  RecipeListView.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 3/1/24.
//

import SwiftUI

import SwiftUI

struct RecipesListView: View {
    @State private var recipeList: [Recipe] = []
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var recipeViewModel: RecipeViewModel
    @State private var isLoading: Bool = true

    init(recipeViewModel: RecipeViewModel) {
        _recipeViewModel = StateObject(wrappedValue: recipeViewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Recetas almacenadas")
                    .font(.headline)
                    .padding(EdgeInsets(top: 10.0, leading: 0, bottom: 0, trailing: 0))

               if recipeList.isEmpty {
                    Spacer()
                    Text("Aún no tienes recetas guardadas")
                        .padding(EdgeInsets(top: 30.0, leading: 30.0, bottom: 30.0, trailing: 30.0))
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(recipeList, id: \.self) { item in
                            NavigationLink(
                                destination: coordinator.makeRecipeDetailView(with: item.id!),
                                label: {
                                    HStack {
                                        Spacer()
                                        Text(item.name)
                                            .lineLimit(1)
                                            .padding(8.0)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "arrowtriangle.right")
                                            .foregroundColor(Color(.systemOrange))
                                            .padding()
                                    }
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                }
                            )
                            .navigationBarBackButtonHidden(false)
                        }
                    }
                    .frame(width: 300, height: 350)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }

                Spacer()
                    .padding(EdgeInsets(top: 8.0, leading: 0, bottom: 0, trailing: 0))
                Text("Puedes pulsar en la receta para poder ver más")
                    .italic()
                    .padding(EdgeInsets(top: 11.0, leading: 0, bottom: 0, trailing: 0))
            }
           
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16))
            .onAppear {
                Task {
                    do {
                        await recipeViewModel.fetchGetAllRecipes()
                        if let recipes = recipeViewModel.recipeList as? [Recipe] {
                            recipeList = recipes
                        } else {
                            print("Error: No se pudo convertir recipeViewModel.recipeList a [Recipe]")
                        }
                    }
                }
            }
            
        }
    }
}


