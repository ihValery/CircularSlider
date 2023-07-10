//
//  IngredientsVM.swift
//  CircularSlider
//
//  Created by Валерий Игнатьев on 8.07.23.
//

import SwiftUI

class IngredientsVM: ObservableObject {
    
    @Published var ingredients: [IngredientModel] = []
    
    init() {
        ingredients = [IngredientModel(name: "Blue", color: .blue),
                       IngredientModel(name: "Green", color: .green),
                       IngredientModel(name: "Yellow", color: .yellow),
                       IngredientModel(name: "Red", color: .red),
                       IngredientModel(name: "Cyan", color: .cyan),
                       IngredientModel(name: "Indigo", color: .indigo),
                       IngredientModel(name: "Mint", color: .mint),
                       IngredientModel(name: "Orange", color: .orange)]
    }
}
