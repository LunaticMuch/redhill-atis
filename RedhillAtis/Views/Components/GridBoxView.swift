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

    var body: some View {

        HStack {
            VStack {
                HStack {
                    Text(title).textCase(.uppercase)
                        .font(.footnote).fontWeight(.medium)
                    Spacer()
                }
                HStack {
                    Text(val).font(.body).fontWeight(.bold)
                    Spacer()
                }
            }
            .padding()
            Spacer()
        }.background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(UIColor.systemGray5))
        )
    }
}

#Preview {
    GridBoxView()
        .environment(AtisViewModel())
}
