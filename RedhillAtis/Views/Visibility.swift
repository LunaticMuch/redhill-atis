//
//  Clouds.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 01/06/2025.
//

import Charts
import SwiftUI

struct VisibilityChartView: View {
    @Environment(VisibilityObservationViewModel.self) var visibilityObservation

    var body: some View {
        NavigationView {
            VStack {

                Chart {
                    ForEach(
                        visibilityObservation.visibilityObservation.indices,
                        id: \.self
                    ) { index in
                        let observation =
                            visibilityObservation.visibilityObservation[index]
                        LineMark(
                            x: .value("Time", index),
                            y: .value("Visibility", observation.visibility)
                        )
                        .foregroundStyle(.green)
                        .lineStyle(StrokeStyle(lineWidth: 2))

                        PointMark(
                            x: .value("Time", index),
                            y: .value("Visibility", observation.visibility)
                        )
                        .foregroundStyle(.green)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading) { value in
                        AxisGridLine()
                        AxisValueLabel {
                            if let intValue = value.as(Int.self) {
                                Text("\(intValue) m")
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
                                    < visibilityObservation
                                    .visibilityObservation
                                    .count {
                                let observation =
                                    visibilityObservation.visibilityObservation[
                                        intValue
                                    ]
                                Text(formatTime(observation.timestamp))
                            }
                        }
                    }
                }
                .frame(height: 400)

                Text(
                    "Last observation at \(formatTime(visibilityObservation.visibilityObservation.last?.timestamp ?? Date().description))"
                ).frame(maxWidth: .infinity, alignment: .leading).padding(.top)

                Text(
                    "Visibility is observed twice every minute. The chart reports the last 40 minutes of data."
                ).frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                Spacer()
            }.padding()
                .task {
                    do {
                        try await visibilityObservation.fetchVisibilityTrend()
                    } catch {
                        print("Error fetching visibility trend: \(error)")
                    }
                }
        }
        .navigationTitle("Visibility Trend")
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
    VisibilityChartView()
        .environment(VisibilityObservationViewModel())
}
