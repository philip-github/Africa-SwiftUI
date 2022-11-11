//
//  CreditsView.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/18/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
                Copyright © Philip Al-Twal
                All rights reserved
                Better apps ♡ less code
                """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }//: VSTACK
        .padding()
        .opacity(0.4)
    }//: BODY
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
