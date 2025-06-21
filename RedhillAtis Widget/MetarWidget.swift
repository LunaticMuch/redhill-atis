//
//  widgetkitapp.swift
//  widgetkitapp
//
//  Created by Stefano Cislaghi on 15/06/2025.
//
import WidgetKit
import SwiftUI

struct MetarWidgetEntryView: View {
    var entry: WidgetProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack {
                Text(entry.atis.metar).padding(.bottom,10)

                Text("Last update: \(entry.date, style: .time)").font(.caption)
            }
        }
        .padding(2)
    }
}

struct MetarWidget: Widget {
    let kind: String = "MetarWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider()) { entry in
            MetarWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Redhill METAR")
        .description("Current METAR for Redhill Airport")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    MetarWidget()
} timeline: {
    WidgetEntry(date: .now, atis: RedhillAtis())
}
