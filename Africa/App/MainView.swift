//
//  MainView.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            //MARK: CONTENT VIEW
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            //MARK: VIDEO LIST VIEW
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            //MARK: MAP VIEW
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            //MARK: GALLERY VIEW
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }//: TAB VIEW
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
