//
//  ContentView.swift
//  RecallChecker
//
//  Created by Pari Gulati on 9/28/24.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 2
    var body: some View {
        TabView (selection: $selection) {
            AlertView()
                .tabItem{
                    Label("Alert", systemImage: "bell")
                }
                .tag(1)
            DataView()
                .tabItem{
                    Label("Data", systemImage: "book")
                }
                .tag(3)
            CameraView()
                .tabItem{
                    Label("Camera", systemImage: "camera")
                }
                .tag(2)
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

