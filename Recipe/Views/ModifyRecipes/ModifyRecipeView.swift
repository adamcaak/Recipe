//
//  ModifyRecipeView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 12/01/2025.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingradients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                Text("Main Editor")
            case .ingredients:
                Text("Ingradients Editor")
            case .directions:
                Text("Directions Editor")
            }
            Spacer()
        }
    }
    
    enum Selection: Hashable {
        case main
        case ingredients
        case directions
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
