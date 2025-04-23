//
//  SettingsView.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import SwiftUI

class Defaults: ObservableObject {
    @AppStorage("showQfe") public var showQfe: Bool = false
}

struct SettingsView: View {

    @StateObject var defaults = Defaults()

    var body: some View {
        NavigationStack {
            List {
                Section {
                        Toggle("Show QFE", isOn: defaults.$showQfe)
                } header: {
                    Text("Settings")
                }
                Section {
                    NavigationLink {
                        InfoView()
                    } label: {
                        Text("About this app")
                    }
                } header: {
                    Text("Settings")
                }
            }
        }
        .navigationTitle("App Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}
