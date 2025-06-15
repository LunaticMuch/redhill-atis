//
//  AppIntent.swift
//  widgetkitapp
//
//  Created by Stefano Cislaghi on 15/06/2025.
//
//
import AppIntents
import WidgetKit

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("Configure your widget.")
}
