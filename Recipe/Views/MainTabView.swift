//
//  MainTabView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 22/01/2025.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()

    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem { Label("Recipes", systemImage: "list.dash") }
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }.tabItem { Label("Favorites", systemImage: "heart.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
            
        }
        .environmentObject(recipeData)
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
