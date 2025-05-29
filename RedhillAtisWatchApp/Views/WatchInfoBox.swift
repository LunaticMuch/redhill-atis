//
//  WatchInfoBox.swift
//  RedhillAtisWatch Watch App
//
//  Created by Stefano Cislaghi on 06/04/2025.
//

import SwiftUI

struct WatchInfoBox: View {
    let label: String
    let info: String
    let isSmall: Bool

    var body: some View {
        let labelFontSize: CGFloat = isSmall == true ? 16 : 20
        let infoFontSize: CGFloat = isSmall == true ? 20 : 32
        VStack {
            Text(label).font(
                .system(size: labelFontSize, weight: .medium, design: .default)
            )
            Text(info).font(
                .system(size: infoFontSize, weight: .regular, design: .default)
            )
        }
    }

}

#Preview {
    WatchInfoBox(
        label: "DEMO", info: "DEMO", isSmall: true
    )
}
