//
//  ContentView.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarGridIcon: String = "square.grid.2x2"

    //MARK: - FUNCTIONS
    func switchGridView() {
        DispatchQueue.main.async {
            withAnimation(.easeIn) {
                gridLayout = Array(repeating: .init(.flexible()), count: (gridLayout.count % 3) + 1)
                switch gridLayout.count {
                case 1:
                    toolBarGridIcon = "square.grid.2x2"
                case 2:
                    toolBarGridIcon = "square.grid.3x2"
                case 3:
                    toolBarGridIcon = "rectangle.grid.1x2"
                default:
                    toolBarGridIcon = "square.grid.2x2"
                }//: SWITCH
            }//: ANIMATION
        }//: MAIN THREAD QUEUE
    }

    func resetGridView() {
        gridLayout = [GridItem(.flexible())]
        toolBarGridIcon = "square.grid.2x2"
    }

    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group{
                if !isGridViewActive {
                    List{
                        //MARK: PAGE TAB VIEW
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 0,
                                                      trailing: 0))

                        //MARK: LIST VIEW
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListView(animal: animal)
                            }//: NAVIGATION LINK
                        }//: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST VIEW
                    .listStyle(.inset)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }//: LOOP
                        }//: GRID
                    }//: SCROLL VIEW
                }//: CONDITIONAL
            }//: GROUP
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            resetGridView()
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            isGridViewActive = true
                            switchGridView()
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: toolBarGridIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HSTACK
                }//: TOOL BAR ITEM
            }//: TOOL BAR
        }//: NAVIGATION VIEW
    }//: BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
