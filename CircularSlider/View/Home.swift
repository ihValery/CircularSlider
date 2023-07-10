//
//  Home.swift
//  CircularSlider
//
//  Created by Валерий Игнатьев on 8.07.23.
//

import SwiftUI

struct Home: View {
    
    @State private var pickerType: TripPicker = .normal
    
    @State private var activeID: UUID?
    
    @State private var ingredientVM = IngredientsVM()
    
    var body: some View {
        VStack {
            Picker("", selection: $pickerType) {
                ForEach(TripPicker.allCases, id: \.rawValue) { name in
                    Text(name.rawValue)
                        .tag(name)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer(minLength: 0)
            
            GeometryReader { geoReader in
                let size = geoReader.size
                //чтобы запустить карусельный слайдер в центре.
                let startCenterPadding = (size.width - 70) / 2
                
                //Circular Carousel Slider
                ScrollView(.horizontal) {
                    HStack(spacing: 35) {
                        ForEach(ingredientVM.ingredients) { product in
                            Circle()
                                .foregroundStyle(product.color)
                                .frame(width: 70, height: 70)
                                .shadow(color: product.color, radius: 5, x: 0, y: 0)
                            
                                .visualEffect { view, proxy in
                                    view.offset(y: offsetSlider(proxy))
                                        .offset(y: scaleActiveProduct(proxy) * -15)
                                }
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
//                                        .offset(y: phase.isIdentity && activeID == product.id ? -15 : 0)
                                }
                        }
                    }
                    .frame(height: size.height)
                    .offset(y: 50)
                    .scrollTargetLayout()
                }
                //новый млдификатор будет считать значения GeometryReader с нуля
                .safeAreaPadding(.horizontal, startCenterPadding)
                .scrollIndicators(.hidden)
                
                //Snapping
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $activeID)
                .frame(height: size.height)
            }
            .frame(height: 200)
         }
    }
    
    //Circular Slider View Offset
    func offsetSlider(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        //Перемещение представления вверх/вниз на основе прогресса
        return progress < 0 ? progress * 30 : progress * -30
    }
    
    func scaleActiveProduct(_ proxy: GeometryProxy) -> CGFloat {
        let progress = min(max(progress(proxy), -1), 1)
        
        return progress < 0 ? 1 + progress : 1 - progress
    }
    
    func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
        return minX / viewWidth
    }
}

#Preview {
    ContentView()
}


//Slider Type
enum TripPicker: String, CaseIterable {
    case scaled = "Scaled"
    case normal = "Normal"
}
