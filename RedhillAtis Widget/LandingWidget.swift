import SwiftUI
//
//  widgetkitapp.swift
//  widgetkitapp
//
//  Created by Stefano Cislaghi on 15/06/2025.
//

import WidgetKit

struct LandingWidgetViewEntryView: View {
    let label: String
    let info: String

    var body: some View {

        VStack {
            Text(label).font(
                .caption
            )
            Text(info).font(
                .title3
            ).fontWeight(.semibold)
        }
    }

}

struct LandingWidgetView: View {
    var entry: WidgetProvider.Entry

    var body: some View {
        Grid {
            GridRow {
                let updatedOnTime =
                    Date(
                        fromString: entry.atis.updatedOn,
                        format: .isoDateTimeFull
                    )?
                    .toString(format: .custom("HH:mm")) ?? ""
                LandingWidgetViewEntryView(
                    label: "Time",
                    info: updatedOnTime,

                )
                LandingWidgetViewEntryView(
                    label: "Runway",
                    info: entry.atis.runway,

                )
            }.frame(maxWidth: .infinity, maxHeight: .infinity)

            GridRow {
                LandingWidgetViewEntryView(
                    label: "Info",
                    info: entry.atis.designator,

                )
                LandingWidgetViewEntryView(
                    label: "QNH",
                    info: entry.atis.qnh,

                )
            }.frame(maxWidth: .infinity, maxHeight: .infinity)

        }
    }
}

struct LandingWidget: Widget {
    let kind: String = "LandingWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider()) { entry in
            LandingWidgetView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Takeoff View")
        .description("Takeoff and Landing operational information")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    LandingWidget()
} timeline: {
    WidgetEntry(date: .now, atis: RedhillAtis())
}
