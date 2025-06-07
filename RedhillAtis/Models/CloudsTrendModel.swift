//
//  CloudsTrendModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 01/06/2025.
//

import Foundation

// struct CloudsTrendModel: Decodable {
//    var observations: [CloudObservation] = [CloudObservation.init()]

struct CloudObservation: Decodable, Identifiable {
        var id: Int = 0
        var timestamp: String = ""
        var base: Int = 0
        var height: Int = 0
    }
// }
