//
//  RedhillAtisApp.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

@main
struct RedhillWeatherApp: App {
    @State private var atis = AtisViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(atis)
        }
    }
}
