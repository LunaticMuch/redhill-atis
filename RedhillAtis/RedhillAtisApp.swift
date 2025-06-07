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
    @State private var metar = MetarViewModel()
    @State private var cloudObservation = CloudObservationViewModel()
    @State private var visibilityObservation = VisibilityObservationViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(atis)
                .environment(metar)
                .environment(cloudObservation)
                .environment(visibilityObservation)
        }
    }
}
