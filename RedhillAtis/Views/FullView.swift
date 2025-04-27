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

    // Define a list of attributes to display and their custom descriptions
    var attributesToDisplay: [(key: String, description: String)] = [
        ("designator", "Designator"),
        ("runway", "Runway"),
        ("qnh", "QNH"),
        ("qfe", "QFE"),
        ("temperature", "Temperature"),
        ("dewPoint", "Dew Point"),
        ("visibility", "Visibility"),
        ("windDescription", "Wind")
    ]

    var body: some View {

        NavigationStack {
            ScrollView {
                HeaderView()

                // Define a fixed two-column layout
                LazyVGrid(columns: [
                    GridItem(.flexible()), GridItem(.flexible())
                ]) {

                    let dic = atis.current.toDictionary()

                    ForEach(attributesToDisplay, id: \.key) { attribute in
                        if let value = dic[attribute.key] {
                            let attr: String = attribute.description  // Use the description for the title
                            let val: String = "\(value)"  // Convert value to string

                            HStack {
                                GridBoxView(title: attr, val: val)
                            }
                        }
                    }
                    // Wind gust
                    if atis.current.isWindGusting {
                        GridBoxView(title: "Wind Gust", val: atis.current.windGust)
                    }
                    if atis.current.isWindVarialeBetween {
                        GridBoxView(title: "Wind Variability", val: atis.current.windVariabilityDescription)
                    }

                    // If any cloud, shows clouds too
                    if atis.current.clouds.isEmpty == false {
                        let cl = atis.current.clouds
                        ForEach(cl, id: \.height) {
                            coverage in
                            GridBoxView(title: "Clouds", val: coverage.label)

                        }
                    }

                }
                .padding(.horizontal)
                GridBoxView(title: "full metar", val: atis.current.metar)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("Current ATIS")
        .task {
            try? await atis.fetchRedhillAtis()
        }
        .refreshable {
            try? await atis.fetchRedhillAtis()
        }
    }
}

#Preview {
    FullView()
        .environment(AtisViewModel())
}
