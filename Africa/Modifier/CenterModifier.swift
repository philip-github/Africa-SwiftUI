//
//  CenterModifier.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/18/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
