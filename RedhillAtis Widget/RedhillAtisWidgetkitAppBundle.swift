//
//  widgetkitappBundle.swift
//  widgetkitapp
//
//  Created by Stefano Cislaghi on 15/06/2025.
//

import WidgetKit
import SwiftUI

@main
struct RedhillAtisWidgetBundle: WidgetBundle {
    var body: some Widget {
        QuickWidget()
        LandingWidget()
        MetarWidget()
    }
}
