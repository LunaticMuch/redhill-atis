//
//  ContentView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AtisView()
                .tabItem {
                    Label("ATIS", systemImage: "cloud.sun.rain.fill")
                }

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
