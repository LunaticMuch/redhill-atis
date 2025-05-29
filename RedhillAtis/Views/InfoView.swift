//
//  InfoView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

let instagramURL = URL(string: "https://instagram.com/theyarestefano")!
let linkedinURL = URL(string: "https://linkedin.com/in/stefanocislaghi")!
let githubURL = URL(string: "https://github.com/lunaticmuch")!

struct InfoView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Redhill Aerodrome ATIS")
                    .font(.system(size: 28, weight: .bold))
                VStack(spacing: 20) {
                    Text(
                        "Redhill Aerodrome ATIS app is a free application which ATIS and Metar information for Redhill Airport (EGKR) in Surrey, UK."
                    )
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(UIColor.systemGray6))
                )
                Text("Disclaimer")
                    .padding(.top, 40)
                    .font(.system(size: 20, weight: .bold))
                VStack(spacing: 20) {
                    Text(
                        "This application is freely based on the data provided the weather station at the airport. In case of any doubt, please call [+44 1737 822947](tel:+441737822947) to listen the official weather service of Redhill Airport."
                    )
                    Text(
                        "If you like project, please consider [buying me a beer](https://buymeacoffee.com/stefanocislaghi)."
                    )
                }.padding().background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(UIColor.systemGray6))
                )
                Spacer()
                Divider()
            }.padding()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
