//
//  RecipeData.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 09/01/2025.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
