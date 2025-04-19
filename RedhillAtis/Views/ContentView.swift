//
//  ContentView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 2
    
    var body: some View {
        TabView(selection:$selection) {
            InFlightView()
                .tabItem {
                    Label("In Flight", systemImage: "airplane.circle.fill")
                }.tag(1)
            FullView()
                .tabItem {
                    Label("Weather", systemImage: "sun.rain.fill")
                }
                .tag(2)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
