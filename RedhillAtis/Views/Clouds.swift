//
//  Clouds.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 01/06/2025.
//

import Charts
import SwiftUI

struct CloudsChartView: View {
    @Environment(CloudObservationViewModel.self) var cloudObservation

    var body: some View {
        NavigationView {
            VStack {
                Chart {
                    ForEach(
                        cloudObservation.cloudObservation.indices,
                        id: \.self
                    ) {
                        index in
                        let observation = cloudObservation.cloudObservation[
                            index
                        ]

                        RectangleMark(
                            x: .value("Time", index),
                            yStart: .value("Base", observation.base),
                            yEnd: .value(
                                "Top",
                                observation.base + observation.height
                            ),
                            width: 4
                        )
                        .foregroundStyle(.blue.opacity(0.7))
                        .cornerRadius(4)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading) { value in
                        AxisGridLine()
                        AxisValueLabel {
                            if let intValue = value.as(Int.self) {
                                Text("\(intValue) ft")
                            }
                        }
                    }
                }
                .chartXAxis {
                    AxisMarks { value in
                        AxisGridLine()
                        AxisValueLabel {
                            if let intValue = value.as(Int.self),
                                intValue
                                    < cloudObservation.cloudObservation.count {
                                let observation =
                                    cloudObservation.cloudObservation[
                                        intValue
                                    ]
                                Text(formatTime(observation.timestamp))
                            }
                        }
                    }
                }

                .frame(height: 400)

                Text(
                    "Last observation at \(formatTime(cloudObservation.cloudObservation.last?.timestamp ?? Date().description))"
                ).frame(maxWidth: .infinity, alignment: .leading).padding(.top)

                Text(
                    "The clouds base and height are observed twice every minute. The chart reports the last 40 minutes of data. The chart reports only the first cloud layer."
                ).frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                Spacer()
            }.padding()
                .task {
                    do {
                        try await cloudObservation.fetchCloudsTrend()
                    } catch {
                        print("Error fetching clouds trend: \(error)")
                    }
                }

        }
        .navigationTitle("Cloud Base & Height Trend")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func formatTime(_ timestamp: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = formatter.date(from: timestamp) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "HH:mm"
            return displayFormatter.string(from: date)
        }

        return timestamp
    }
}

#Preview {
    CloudsChartView()
        .environment(CloudObservationViewModel())
}
