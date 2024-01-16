//
//  IngredientsListView.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 3/1/24.
//
import SwiftUI

struct IngredientsListView: View {
    @State private var ingredientsList: [String] = []
    @State private var isAddingIngredient = false
    @State private var newIngredient = ""
    @State private var showAlert = false
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: ChatgptViewModel
    
    init( viewModel: ChatgptViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            VStack {
                Text("Tabla de ingredientes")
                    .font(.headline)
                    .padding(EdgeInsets(top: 10.0, leading: 0, bottom: 0, trailing: 0))
                
                if ingredientsList.isEmpty {
                    Spacer()
                    Text("Lista vacía, pulsa en el botón 'Añadir' para agregar tantos ingredientes como quieras y posteriormente en el botón 'Buscar'.")
                        .italic()
                        .padding(EdgeInsets(top: 30.0, leading: 30.0, bottom: 30.0, trailing: 30.0))
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(ingredientsList, id: \.self) { item in
                            HStack {
                                Text(item)
                                    .padding(8.0)
                                
                                Spacer()
                                
                                Button(action: {
                                    removeIngredient(item)
                                }) {
                                    Image(systemName: "xmark.circle")
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .foregroundColor(.black)
                            .frame(height: 40.0)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 300, trailing: 30))
                    
                }
                
                Spacer()
                Text("Esta es la lista de ingredientes necesarios para encontrar una receta ")
                    .font(.subheadline)
                    .padding(EdgeInsets(top: 10.0, leading: 20, bottom: 20, trailing: 20))
                HStack(spacing: 16) {
                    Button(action: {
                        if ingredientsList.isEmpty {
                                showAlert = true
                        }
                    }) {
                        NavigationLink(destination: coordinator.makeIngredientsDetailView(with: ingredientsList)){
                            Label("Buscar", systemImage: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(8)
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }.navigationBarBackButtonHidden(true)
                    }
                    .disabled(ingredientsList.isEmpty)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Lista de ingredientes vacía"),
                            message: Text("Introduce algún ingrediente antes de buscar."),
                            dismissButton: .default(Text("OK"))
                        )
                    }

                    Button(action: {
                        isAddingIngredient = true
                    }) {
                        Label("Añadir", systemImage: "cart")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $isAddingIngredient) {
                       
                        VStack(alignment: .center, spacing: 16) {
                            Spacer()
                            Text("Añadir Ingrediente")
                                .font(.title)
                                .padding()
                            Text("Introduce aquí un ingrediente que tengas.")
                                .font(.subheadline)

                            TextField("Nuevo Ingrediente", text: $newIngredient)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Button(action: {
                                if !newIngredient.isEmpty {
                                       ingredientsList.append(newIngredient)
                                       newIngredient = ""
                                       isAddingIngredient = false
                                }
                            }) {
                                Text("Añadir a la lista")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.orange)
                                    .cornerRadius(8)
                            }
                            .padding()
                            Spacer()
                        }
                        .padding()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }
    
    private func removeIngredient(_ ingredient: String) {
        if let index = ingredientsList.firstIndex(of: ingredient) {
            ingredientsList.remove(at: index)
        }
    }
}
