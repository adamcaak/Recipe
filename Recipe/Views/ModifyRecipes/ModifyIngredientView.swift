//
//  ModifyIngredientView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 14/01/2025.
//

import SwiftUI

struct ModifyIngredientView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @State var ingredient: Ingredient
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity")
                        TextField("Quantity",
                                  value: $ingredient.quantity,
                                  formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                    }
                }
                Picker(selection: $ingredient.unit, label:
                        HStack {
                    Text("Unit")
                    Spacer()
                    //Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredinet = Ingredient(name: "", quantity: 1.0, unit: .none)
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(ingredient: emptyIngredinet)
        }
    }
}
