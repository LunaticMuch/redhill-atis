//
//  widgetkitapp.swift
//  widgetkitapp
//
//  Created by Stefano Cislaghi on 15/06/2025.
//
import WidgetKit
import SwiftUI

struct QuickWidgetView: View {
    var entry: WidgetProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("EGKR")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Text(entry.atis.designator)
                    .font(.title2).fontWeight(.bold)
//                    .foregroundColor(.secondary)
            }

            HStack {
                Text("Runway")
                Spacer()
                Text("\(entry.atis.runway)")

            }.font(.subheadline)

            HStack {
                Text("QNH")
                Spacer()
                Text("\(entry.atis.qnh)")

            }.font(.subheadline)
            HStack {
                Text("Wind")
                Spacer()
                Text("\(entry.atis.windDirection)/\(entry.atis.windSpeed)")

            }.font(.subheadline)
            HStack {
                Text("Visibility")
                Spacer()
                Text("\(entry.atis.visibility)")

            }.font(.subheadline)

        }
        .padding(8)
    }
}

struct QuickWidget: Widget {
    let kind: String = "QuickWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider()) { entry in
            QuickWidgetView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Quick View")
        .description("Simplified view of ATIS information")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    QuickWidget()
} timeline: {
    WidgetEntry(date: .now, atis: RedhillAtis())
}
