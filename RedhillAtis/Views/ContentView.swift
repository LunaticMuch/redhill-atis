//
//  ContentView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(AtisViewModel.self) var atis
    @Environment(\.colorScheme) var colorScheme // Detect light or dark mode
    @State private var selection = 2

    var body: some View {

        VStack(spacing: 0) {
            Divider()
            TabView(selection: $selection) {
                Group {
                    InFlightView()
                        .tabItem {
                            Label(
                                "In Flight",
                                systemImage: "airplane.circle.fill"
                            )
                        }.tag(1)
                    FullView()
                        .tabItem {
                            Label("Weather", systemImage: "sun.rain.fill")
                        }
                        .tag(2)

                }
                .toolbarBackground(Color(UIColor.systemGray6), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.light)
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                    .toolbarBackground(
                                colorScheme == .dark ? Color(UIColor.systemGray6) : Color(UIColor.systemGray5), // Set color based on mode
                                for: .tabBar
                            )                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.light)
            }
        }

    }
}

#Preview {
    ContentView()
        .environment(AtisViewModel())
}
