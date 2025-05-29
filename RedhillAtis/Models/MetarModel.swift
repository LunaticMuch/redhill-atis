//
//  MetarModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 05/05/2025.
//

import Foundation

struct Metar: Decodable {
    var rawOb: String = ""
    var icaoId: String = ""
}
