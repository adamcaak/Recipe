//
//  Recipe.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 08/01/2025.
//

import Foundation

struct Recipe {
    var mainInformation: MainInformation
    var ingredients: [Ingredient]
    var directions: [Direction]
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category //Breakfast, Lunch, Dinner, Dessert
    
    enum Category: String, CaseIterable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
}

struct Ingredient {
    var name: String
    var quantity: Double
    var unit: Unit // Ounces, Grams, Cups, Tablespoons, Teaspoons, None
    
    enum Unit: String, CaseIterable {
        case ounces = "Ounces"
        case grams = "Grams"
        case cups = "Cups"
        case tablespoons = "Tablespoons"
        case teaspoons = "Teaspoons"
        case none = "None"
    }
}

struct Direction {
    var description: String
    var isOptional: Bool
}
