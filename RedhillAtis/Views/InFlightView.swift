//
//  AtisView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import DateHelper
import SwiftUI

struct InFlightView: View {
    @Environment(AtisViewModel.self) var atis

    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView()
                ZStack {
                    Color(UIColor.systemGray5)
                    VStack {
                        Text("Information").font(.title)
                        Spacer()
                        Text(atis.current.designator).font(
                            .system(size: 54, weight: .bold)
                        )
                    }
                    .padding()
                }
                .compositingGroup()
                .cornerRadius(10)
                .padding(.horizontal)
                ZStack {
                    Color(UIColor.systemGray5)
                    VStack {
                        Text("Runway").font(.title)
                        Spacer()
                        Text(atis.current.runway).font(
                            .system(size: 54, weight: .bold)
                        )
                    }
                    .padding()
                }
                .compositingGroup()
                .cornerRadius(10)
                .padding(.horizontal)
                ZStack {
                    Color(UIColor.systemGray5)
                    VStack {
                        Text("QNH").font(.title)
                        Spacer()
                        Text(String(atis.current.qnh)).font(
                            .system(size: 54, weight: .bold)
                        )
                    }
                    .padding()
                }
                .compositingGroup()
                .cornerRadius(10)
                .padding(.horizontal)
                ZStack {
                    Color(UIColor.systemGray5)
                    VStack {
                        Text("Last Metar").font(.title)
                        Spacer()
                        Text(atis.current.metar).font(.title3)
                    }
                    .padding()
                }
                .compositingGroup()
                .cornerRadius(10)
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
    InFlightView()
        .environment(AtisViewModel())
}
