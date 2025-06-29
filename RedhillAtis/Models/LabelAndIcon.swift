//
//  LabelAndIcon.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 07/06/2025.
//

import SwiftUI

// Note: customize icon to be on the right
struct LabelAndIcon: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            configuration.title
            configuration.icon

        }
    }
}
