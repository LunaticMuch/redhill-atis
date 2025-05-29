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
                        .font(.footnote).fontWeight(.medium).foregroundStyle(.opacity(0.9))
                    Spacer()
                }
                HStack {
                    Text(val).font(.body).fontWeight(.medium)
                    Spacer()
                }
            }
            .padding(.vertical)
            .padding(.horizontal, )
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
}
