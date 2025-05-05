//
//  MetarView\.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 05/05/2025.
//

import SwiftUI

struct MetarBoxView: View {

    var code: String = "Label"
    var metar: String = "Value"

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(code).textCase(.uppercase)
                        .font(.footnote).fontWeight(.medium).foregroundStyle(.opacity(0.9))
                    Spacer()
                }
                HStack {
                    Text(metar).font(.body).fontWeight(.medium)
                    Spacer()
                }
            }
            .padding(.vertical)
            .padding(.horizontal)
            Spacer()
        }.background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(UIColor.systemGray6))
        )
    }
}

#Preview {
    MetarBoxView()
}
