//
//  ModifyIngredientsView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 14/01/2025.
//

import SwiftUI

struct ModifyComponentsView: View {
    @Binding var ingredients: [Ingredient]
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @State private var newIngredient = Ingredient(name: "", quantity: 0.0, unit: .none)
    
    protocol ModifyComponentView: View {
        associatedtype Component
        init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
    }
    
    protocol RecipeComponent {
        init ()
    }
    
    var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                ingredients.append(ingredient)
                newIngredient = Ingredient(name: "", quantity: 0.0, unit: .none)
            }.navigationTitle("Add Ingredient")
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                HStack {
                    Text("Ingredients")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    .listRowBackground(listBackgroundColor)
                    NavigationLink("Add another Ingredient",
                                   destination: addIngredientView)
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(listBackgroundColor)
                }.foregroundColor(listTextColor)
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredient = Ingredient(name: "", quantity: 0.0, unit: .none)
    @State static var recipe = Recipe.testRecipes[1]
    @State static var emptyIngredients = [Ingredient]()
    static var previews: some View {
        NavigationView {
            ModifyComponentsView(ingredients: $recipe.ingredients)
        }
        NavigationView {
            ModifyComponentsView(ingredients: $emptyIngredients)
        }
    }
}
