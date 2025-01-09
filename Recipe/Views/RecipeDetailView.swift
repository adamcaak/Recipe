//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 09/01/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text("\(recipe.mainInformation.description)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }
                }
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
  @State static var recipe = Recipe.testRecipes[0]
  static var previews: some View {
    NavigationView {
      RecipeDetailView(recipe: recipe)
    }
  }
}
