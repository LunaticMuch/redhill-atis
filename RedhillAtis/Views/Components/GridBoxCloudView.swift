//
//  GridBox.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 18/04/2025.
//

import SwiftUI

struct GridBoxCloudView: View {

    var clouds: [CloudCoverage] = [CloudCoverage]()

    var body: some View {

        HStack {
            VStack {
                HStack {
                    Label {
                        Text("Clouds")
                            .textCase(.uppercase)
                            .font(.footnote).fontWeight(.medium)
                            .foregroundStyle(
                                .opacity(0.9)
                            )
                    } icon: {
                        Image(systemName: "arrow.right.square")
                            .scaledToFit()
                            .opacity(0.8)

                    }.labelStyle(LabelAndIcon())
                    Spacer()
                }
                if clouds.isEmpty {
                    HStack {
                        Spacer()
                        Text("No Cloud Detected").font(.body).fontWeight(
                            .medium
                        )
                        Spacer()
                    }
                } else {
                    ForEach(clouds) {
                        cloud in
                        HStack {
                            Text(cloud.label).font(.body).fontWeight(
                                .medium
                            )
                            Spacer()
                            Text("\(String(cloud.height)) ft").font(.body)
                                .fontWeight(
                                    .medium
                                )
                        }
                    }
                }

            }.padding()
        }.background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(UIColor.systemGray6))
        ).padding(.horizontal)
    }
}

#Preview {
    GridBoxCloudView()
        .environment(AtisViewModel())
    GridBoxCloudView(clouds: [CloudCoverage(type: 2, height: 3000, coverage: 4)]
    )
    GridBoxCloudView(clouds: [
        CloudCoverage(type: 2, height: 3000, coverage: 4),
        CloudCoverage(type: 2, height: 4000, coverage: 8),
        CloudCoverage(type: 2, height: 5000, coverage: 2),
    ])
}
