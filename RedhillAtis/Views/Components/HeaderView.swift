//
//  HeaderView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 19/04/2025.
//

import DateHelper
import SwiftUI

struct HeaderView: View {
    @Environment(AtisViewModel.self) var atis

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                let updatedOnTime =
                    Date(
                        fromString: atis.current.updatedOn,
                        format: .isoDateTimeFull
                    )?
                    .toString(format: .custom("HH:mm")) ?? ""
                Text("Redhill Airport")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("ATIS information at \(updatedOnTime)").fontWeight(
                    .bold
                )
            }
            Spacer()
            if atis.current.isAutomatic { AutoTagView() }

        }.padding()
    }
}

#Preview {
    HeaderView()
        .environment(AtisViewModel())
}
