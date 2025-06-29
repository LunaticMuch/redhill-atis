//
//  VisibilityTrendModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 04/06/2025.
//

import Foundation

struct VisibilityObservation: Decodable, Identifiable {
    var id: Int = 0
    var timestamp: String = ""
    var visibility: Int = 0
}
