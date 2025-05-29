//
//  AtisView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import DateHelper
import SwiftUI

struct InFlightView: View {
    @Environment(AtisViewModel.self) var atis
    @StateObject var defaults = Defaults()

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State private var showingAlert = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView()

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

                LazyVGrid(columns: gridItems, spacing: 20) {
                    GridBigBoxView(
                        title: "Designator",
                        val: atis.current.designator
                    )
                    GridBigBoxView(title: "Runway", val: atis.current.runway)
                    GridBigBoxView(
                        title: defaults.showQfe ? "QFE" : "QNH",
                        val: String(
                            defaults.showQfe
                                ? atis.current.qfe : atis.current.qnh
                        )
                    )
                    GridBigBoxView(
                        title: "Last Metar",
                        val: atis.current.metar,
                        isMetar: true
                    )
                }
                .padding()
            }
        }
        .navigationTitle("Current ATIS")
        .task {
            do {
                try await atis.fetchRedhillAtis()
            } catch {
                // Handle the error and show an alert
                alertMessage = error.localizedDescription
                showingAlert = true
            }
        }
        .refreshable {
            do {
                try await atis.fetchRedhillAtis()
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
    InFlightView()
        .environment(AtisViewModel())
}
