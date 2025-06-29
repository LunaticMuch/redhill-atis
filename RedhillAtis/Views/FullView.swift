//
//  FullView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 15/04/2025.
//

//
//  AtisView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import DateHelper
import SwiftUI

struct FullView: View {
    @Environment(AtisViewModel.self) var atis

    @State private var showingAlert = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView()

                // Define a fixed two-column layout
                LazyVGrid(columns: [
                    GridItem(.flexible()), GridItem(.flexible()),
                ]) {

                    GridBoxView(
                        title: "Designator",
                        val: atis.current.designator
                    )
                    GridBoxView(
                        title: "Runway",
                        val: atis.current.runway
                    )

                    GridBoxView(
                        title: "QNH",
                        val: atis.current.qnh
                    )
                    GridBoxView(
                        title: "QFE",
                        val: atis.current.qfe
                    )

                    GridBoxView(
                        title: "Temperature",
                        val: atis.current.temperature + " °C"
                    )

                    GridBoxView(
                        title: "Dewpoint",
                        val: atis.current.dewPoint + " °C"
                    )

                    NavigationLink(destination: VisibilityChartView()) {
                        GridBoxView(
                            title: "Visibility",
                            val: atis.current.visibility,
                            isNavigationLink: true
                        )
                    }.buttonStyle(.plain)
                    GridBoxView(
                        title: "Wind",
                        val: atis.current.windDescription
                    )

                }
                .padding(.horizontal)
                // If any cloud, shows clouds too
                NavigationLink(destination: CloudsChartView()) {
                    GridBoxCloudView(clouds: atis.current.clouds)
                }.buttonStyle(.plain)

                GridBoxView(title: "full metar", val: atis.current.metar)
                    .padding(.horizontal)

                if atis.current.remarks != "" {
                    GridBoxView(
                        title: "Remarks",
                        val: atis.current.remarks
                    ).padding(.horizontal)
                }
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
    FullView()
        .environment(AtisViewModel())
        .environment(CloudObservationViewModel())
        .environment(VisibilityObservationViewModel())
}
