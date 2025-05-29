//
//  MetarView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 05/05/2025.
//

import Foundation
import SwiftUI

// Enum for ICAO codes and their corresponding airport names
// Function to get the airport name from the ICAO code
func getAirportName(from icaoCode: String) -> String {
    // Create a dictionary mapping ICAO codes to airport names
    let airportMapping: [String: String] = [
        "EGWU": "RAF Northolt",
        "EGMC": "London Southend Airport",
        "EGLL": "London Heathrow Airport",
        "EGSS": "London Stansted Airport",
        "EGLF": "Farnborough Airport",
        "EGLC": "London City Airport",
        "EGMD": "Lydd Airport",
        "EGKK": "London Gatwick Airport",
        "EGVO": "RAF Odiham",
        "EGKB": "Biggin Hill Airport",
        "EGKA": "Shoreham Airport",
        "EGGW": "London Luton Airport",
    ]

    // Return the airport name or "Unknown Airport" if not found
    return airportMapping[icaoCode] ?? "Unknown Airport"
}

struct MetarView: View {
    @Environment(MetarViewModel.self) var metar
    @StateObject var defaults = Defaults()

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State private var showingAlert = false
    @State private var alertMessage: String = ""

    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Nearby METARs")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
            }.padding(.horizontal)

            // Determine the number of columns based on size classes
            let columns: Int =
                (horizontalSizeClass == .compact
                    && verticalSizeClass == .regular)
                ? 1
                : (horizontalSizeClass == .regular
                    && verticalSizeClass == .compact) ? 2 : 2

            let gridItems = Array(
                repeating: GridItem(.flexible()),
                count: columns
            )

            LazyVGrid(columns: gridItems, spacing: 8) {

                ForEach(
                    Array(metar.metar.enumerated()),
                    id: \.offset
                ) {
                    _,
                    object in
                    MetarBoxView(
                        code: getAirportName(from: object.icaoId) + " ("
                            + object.icaoId + ")",
                        metar: object.rawOb
                    )
                }
            }.padding(.horizontal)
        }
        .navigationTitle("Nearby METARs")
        .task {
            do {
                try await metar.fetchMetar()
            } catch {
                // Handle the error and show an alert
                alertMessage = error.localizedDescription
                showingAlert = true
            }
        }
        .refreshable {
            do {
                try await metar.fetchMetar()
            } catch {
                // Handle the error and show an alert
                alertMessage = error.localizedDescription
                showingAlert = true
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }

}

#Preview {
    MetarView()
        .environment(MetarViewModel())
}
