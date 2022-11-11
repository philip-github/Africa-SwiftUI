//
//  AnimalListView.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import SwiftUI

struct AnimalListView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
            HStack(alignment: .center, spacing: 16) {
                //MARK: - IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                VStack(alignment: .leading, spacing: 8) {
                    //MARK: - TITLE
                    Text(animal.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                    //MARK: HEADLINE
                    Text(animal.headline)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                }//: VSTACK
            }//: HSTACK
    }//: BODY
}

struct AnimalListView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
