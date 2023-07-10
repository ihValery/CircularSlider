//
//  IngredientModel.swift
//  CircularSlider
//
//  Created by Валерий Игнатьев on 8.07.23.
//

import SwiftUI

struct IngredientModel: Identifiable {
    
    let id = UUID()
    var name: String
    var color: Color
    
    internal init(name: String, color: Color) {
        self.name = name
        self.color = color
    }
}
