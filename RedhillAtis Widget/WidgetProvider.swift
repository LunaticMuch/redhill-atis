//
//  WidgetProvider.swift
//  RedhillAtis Widget
//
//  Created by Stefano Cislaghi on 21/06/2025.
//

import SwiftUI
import WidgetKit

struct WidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date(), atis: RedhillAtis())
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> Void) {
        let entry = WidgetEntry(date: Date(), atis: RedhillAtis())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
        Task {
            do {
                let viewModel = AtisViewModel()
                try await viewModel.fetchRedhillAtis()

                let currentDate = Date()
                let entry = WidgetEntry(date: currentDate, atis: viewModel.current)

                // Refresh every 5 minutes
                let nextUpdate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
                completion(timeline)
            } catch {
                // Fallback to placeholder data
                let entry = WidgetEntry(date: Date(), atis: RedhillAtis())
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(300)))
                completion(timeline)
            }
        }
    }
}

struct WidgetEntry: TimelineEntry {
    let date: Date
    let atis: RedhillAtis
}
