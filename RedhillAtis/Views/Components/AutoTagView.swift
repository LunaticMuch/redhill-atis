//
//  AutoTagView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 19/04/2025.
//

import Foundation
import SwiftUI

struct AutoTagView: View {

    var body: some View {

        HStack {
            Text("AUTO").padding(.vertical, 5).padding(
                .horizontal,
                10
            ).fontWeight(.semibold).foregroundStyle(.white)
        }.background {
            RoundedRectangle(cornerRadius: 6, style: .continuous).fill(.indigo)
        }
    }
}

#Preview {
    AutoTagView()
        .environment(AtisViewModel())
}
