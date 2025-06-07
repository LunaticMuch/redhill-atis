//
//  GridBox.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 18/04/2025.
//

import SwiftUI

struct GridBoxView: View {

    var title: String = "Label"
    var val: String = "Value"
    var isNavigationLink: Bool? = false

    var body: some View {

        HStack {
            VStack {
                if isNavigationLink == true {
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
                } else {
                    HStack {
                        Text(title).textCase(.uppercase)
                            .font(.footnote).fontWeight(.medium)
                            .foregroundStyle(
                                .opacity(0.9)
                            )
                        Spacer()
                    }
                }
                HStack {
                    Text(val).font(.body).fontWeight(.medium)
                    Spacer()
                }
            }
            .padding()
            Spacer()
        }.background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(UIColor.systemGray6))
        )
    }
}

#Preview {
    GridBoxView()
        .environment(AtisViewModel())
    GridBoxView(title: "Label", val: "Value", isNavigationLink: true)

}
