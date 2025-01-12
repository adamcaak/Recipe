//
//  RecipeCategoryGridView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 10/01/2025.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData()
    var body: some View {
        NavigationView {
            ScrollView {
                let columns = [GridItem(), GridItem()]
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(destination: RecipesListView(category: category)
                            .environmentObject(recipeData),
                                       label: {
                            CategoryView(category: category)
                        })
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
