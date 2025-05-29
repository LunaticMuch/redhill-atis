//
//  GridBigBoxView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 04/05/2025.
//

import SwiftUI

struct GridBigBoxView: View {

    var title: String = "Label"
    var val: String = "Value"
    var isMetar: Bool = false

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Spacer()
                    Text(title)
                        .font(.title).fontWeight(.medium)
                    Spacer()
                }

                Text(val).font(
                    isMetar
                        ? .system(.title3) : .system(size: 54, weight: .bold)
                )

            }
            .padding()
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(UIColor.systemGray6))
        )
    }
}

#Preview {
    GridBigBoxView()
        .environment(AtisViewModel())
}
