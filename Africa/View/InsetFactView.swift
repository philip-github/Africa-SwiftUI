//
//  InsetFactView.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES
    var animal: Animal
    
    //MARK: BODY
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id:\.self) { item in
                    Text(item)
                }
            }//: TAB VIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,
                   idealHeight: 168,
                   maxHeight: 180)
        }//: GROUP BOX
        .padding(.horizontal)
    }//: BODY
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
