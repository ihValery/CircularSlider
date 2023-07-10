//
//  ContentView.swift
//  CircularSlider
//
//  Created by Валерий Игнатьев on 8.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Create pizza")
        }
    }
}

#Preview {
    ContentView()
}
