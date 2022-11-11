//
//  GalleryView.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - FUNCTIONS
    func switchGridLayout() {
        DispatchQueue.main.async {
            withAnimation(.easeIn) {
                gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
            }
        }
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                //MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 5))
                
                //MARK: SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1, onEditingChanged: { _ in
                    switchGridLayout()
                })
                .padding(.horizontal)
                
                //MARK: GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//: LOOP
                }//: GRID/
                .onAppear {
                    switchGridLayout()
                }
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLL VIEW
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }//: BODY
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
