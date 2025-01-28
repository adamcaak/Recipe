//
//  RecipeData.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 09/01/2025.
//
import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        return nil
    }
    
    func saveRecipes() {
        do {
            let encodedData = try JSONEncoder().encode(recipes)
            try encodedData.write(to: recipesFileURL)
        } catch {
            fatalError("An occurred while saving the recipes: \(error)")
        }
    }
    
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipesFileURL) else { return }
        
        do {
            let saveRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = saveRecipes
        } catch {
            fatalError("An error occurred while loading recipes: \(error)")
        }
    }
    
    private var recipesFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        } catch {
            fatalError("An error occured while getting the url: \(error)")
        }
    }
}
