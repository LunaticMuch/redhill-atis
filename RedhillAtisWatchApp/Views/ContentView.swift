//
//  ContentView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI
import DateHelper

struct WatchInfoBox: View {
    let label: String
    let info: String

    var body: some View {
        VStack {
            Text(label)
            Text(info).font(.largeTitle)
        }
    }
        
}

struct ContentView: View {
    @Environment(AtisViewModel.self) var atis

    var body: some View {
        ScrollView {
            Grid {
                GridRow {
                    WatchInfoBox(label: "Info", info: atis.current.designator)
                    WatchInfoBox(label: "Runway", info: atis.current.runway)
                }
                .padding()
                GridRow {
                    WatchInfoBox(label: "QNH", info: String(atis.current.qnh))
                    let updatedOnTime = Date(fromString: atis.current.updatedOn, format: .isoDateTimeFull)?
                        .toString(format: .custom("HH:mm")) ?? ""
                    WatchInfoBox(label: "Time", info: updatedOnTime)
                }
                .padding(.horizontal)
            }
            .padding()
            .task {
                try? await atis.fetchRedhillAtis()
            }
            .refreshable {
                try? await atis.fetchRedhillAtis()
            }
        }
    }

}

#Preview {
    ContentView()
        .environment(AtisViewModel())
}
