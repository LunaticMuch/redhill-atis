//
//  widgetkitapp.swift
//  widgetkitapp
//
//  Created by Stefano Cislaghi on 15/06/2025.
//

import SwiftUI
import WidgetKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(
            date: Date(),
            configuration: ConfigurationAppIntent(),
            atis: RedhillAtis()
        )
    }

    func snapshot(
        for configuration: ConfigurationAppIntent,
        in context: Context
    ) async -> SimpleEntry {
        SimpleEntry(
            date: Date(),
            configuration: configuration,
            atis: RedhillAtis()
        )
    }

    func timeline(
        for configuration: ConfigurationAppIntent,
        in context: Context
    ) async -> Timeline<SimpleEntry> {
        do {
            let viewModel = AtisViewModel()
            try await viewModel.fetchRedhillAtis()

            let currentDate = Date()
            let entry = SimpleEntry(
                date: currentDate,
                configuration: configuration,
                atis: viewModel.current
            )

            // Refresh every 5 minutes
            let nextUpdate = Calendar.current.date(
                byAdding: .minute,
                value: 5,
                to: currentDate
            )!
            let timeline = Timeline(
                entries: [entry],
                policy: .after(nextUpdate)
            )
            return timeline
        } catch {
            // Fallback to placeholder data
            let entry = SimpleEntry(
                date: Date(),
                configuration: configuration,
                atis: RedhillAtis()
            )
            let timeline = Timeline(
                entries: [entry],
                policy: .after(Date().addingTimeInterval(300))
            )
            return timeline
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let atis: RedhillAtis
}

struct SmallWidgetApp: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack {
                    Text("EGKR")
                        .font(.headline)
                        .fontWeight(.bold)

                    Text(entry.atis.updatedOnTime).font(.footnote)

                }
                Spacer()
                Text(entry.atis.designator)
                    .font(.title).fontWeight(.bold)

            }
            HStack {
                Text("Runway").font(.subheadline)
                Spacer()
                Text(entry.atis.runway)
            }
            HStack {
                Text("QNH").font(.subheadline)
                Spacer()
                Text(entry.atis.qnh)
            }

            HStack {
                Text("Wind").font(.subheadline)
                Spacer()
                Text("\(entry.atis.windSpeed)/\(entry.atis.windDirection)")
            }
        }
        .padding(8)
    }
}

struct RedhillAtisWidgetkitApp: Widget {
    let kind: String = "RedhillAtisWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ConfigurationAppIntent.self,
            provider: Provider()
        ) { entry in
            SmallWidgetApp(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Redhill ATIS")
        .description("Current weather conditions at Redhill Airport")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    RedhillAtisWidgetkitApp()
} timeline: {
    SimpleEntry(
        date: .now,
        configuration: ConfigurationAppIntent(),
        atis: RedhillAtis()
    )
}
