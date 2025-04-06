//
//  ContentView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import DateHelper
import SwiftUI

struct ContentView: View {
    @Environment(AtisViewModel.self) var atis

    var body: some View {
        GeometryReader { geo in
            // NOTE: not the best - check if display size is big or not
            let isSmall = geo.size.height > 150 ? false : true

            NavigationStack {
                Grid {
                    GridRow {
                        let updatedOnTime =
                            Date(
                                fromString: atis.current.updatedOn,
                                format: .isoDateTimeFull
                            )?
                            .toString(format: .custom("HH:mm")) ?? ""
                        WatchInfoBox(
                            label: "Time",
                            info: updatedOnTime,
                            isSmall: isSmall
                        )
                        WatchInfoBox(
                            label: "Runway",
                            info: atis.current.runway,
                            isSmall: isSmall
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                    GridRow {
                        WatchInfoBox(
                            label: "Info",
                            info: atis.current.designator,
                            isSmall: isSmall
                        )
                        WatchInfoBox(
                            label: "QNH",
                            info: atis.current.qnh,
                            isSmall: isSmall
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal)
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            Task {
                                try? await atis.fetchRedhillAtis()
                            }
                        } label: {
                            Text("Update").padding(.horizontal)
                        }
                    }
                }
            }

            .task {
                try? await atis.fetchRedhillAtis()
            }
        }
    }

}

#Preview {
    ContentView()
        .environment(AtisViewModel())
}
