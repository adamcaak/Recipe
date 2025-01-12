//
//  RecipesListView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 08/01/2025.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    @State private var isPresented: Bool = false
    @State private var newRecipe = Recipe()
    
    let category: MainInformation.Category
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresented = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        .sheet(isPresented: $isPresented, content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresented = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                recipeData.recipes.append(newRecipe)
                                isPresented = false
                            }
                        }
                    })
                    .navigationTitle("Add a New Recipe")
            }
        })
    }
}

extension RecipesListView {
    
    private var recipes: [Recipe] {
       recipeData.recipes(for: category)
     }
     
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
        RecipesListView(category: .breakfast)
            .environmentObject(RecipeData())
    }
  }
}
