//
//  HomePageView.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 3/1/24.
//
import SwiftUI


struct HomePageView: View {
    @EnvironmentObject var coordinator: Coordinator
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().backgroundColor = UIColor.orange
    }

    var body: some View {
       
        NavigationView {
            ZStack {
                Color.orange.edgesIgnoringSafeArea(.all)
                
                TabView {
                    coordinator.makeIngredientsListView()
                        .tabItem {
                            Label("Buscar", systemImage: "magnifyingglass")
                        }
                        .tag(0)
                    
                    coordinator.makeRecipeListView()
                        .tabItem {
                            Label("Recetas", systemImage: "book")
                        }
                        .tag(1)
                }
                .navigationTitle("Receptom")
                .accentColor(.black)
                .navigationBarTitleDisplayMode(.inline)
                .statusBar(hidden: false)
            }
        }
    }
}


#Preview {
    let coordinator = Coordinator()
    return coordinator.makeHomePageView()
}
