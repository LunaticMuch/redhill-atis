//
//  ContentView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(AtisViewModel.self) var atis
    @Environment(MetarViewModel.self) var metar
    @Environment(\.colorScheme) var colorScheme  // Detect light or dark mode

    @StateObject var defaults = Defaults()

    @State var selection = 1

    var body: some View {
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
                MetarView()
                    .tabItem {
                        Label("METARs", systemImage: "map.circle")
                    }
                    .tag(3)

            }
            .toolbarBackground(Color(UIColor.systemGray6), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.light)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .toolbarBackground(
                    colorScheme == .dark
                        ? Color(UIColor.systemGray6)
                        : Color(
                            UIColor.systemGray5
                        ),
                    // Set color based on mode
                    for: .tabBar
                ).toolbarBackground(
                    .visible,
                    for: .tabBar
                )
                .toolbarColorScheme(.light)
        }.onAppear {
            // Set selection based on the value of defaults.showInFlightOnLaunch
            selection = defaults.showInFlightOnLaunch ? 1 : 2
        }

    }
}

#Preview {
    ContentView()
        .environment(AtisViewModel())
}
