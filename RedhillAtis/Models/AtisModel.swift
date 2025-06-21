//
//  AtisModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import Foundation
import DateHelper

struct CloudCoverage: Decodable, Identifiable {

    var type: Int = 0
    var height: Int = 0
    var coverage: Int = 0

    var label: String {
        let coverLabel: String
        switch coverage {
        case 1...2:
            coverLabel = "FEW"
        case 3...4:
            coverLabel = "SCATTERED"
        case 5...7:
            coverLabel = "BROKEN"
        case 8:
            coverLabel = "OVERCAST"
        default:
            coverLabel = "UNKNOWN"
        }
        return "\(coverLabel)"
    }

    var id: UUID {
        UUID()
    }

}

struct RedhillAtis: Decodable {
    var site: String
    var metar: String
    var designator: String
    var runway: String
    var updatedOn: String
    var qfe: String
    var qnh: String
    var isAutomatic: Bool
    var isCavok: Bool
    var temperature: String
    var dewPoint: String
    var visibility: String
    // Wind
    var windSpeed: String
    var windDirection: String
    var windBetweenFrom: String
    var windBetweenTo: String
    var windGust: String
    var isWindVariable: Bool
    var isWindGusting: Bool
    var isWindVarialeBetween: Bool
    var remarks: String
    var clouds: [CloudCoverage] = []

    init() {
        self.site = ""
        self.metar = "EGKR 211022Z 17008KT FEW2000 SCT4000 BKN5000 9999 10/23 Q1013"
        self.designator = "A"
        self.runway = "01L"
        self.updatedOn = "2025-01-01T00:00:00.000+00:00"
        self.qfe = "0000"
        self.qnh = "1919"
        self.temperature = "00"
        self.dewPoint = "00"
        self.visibility = "9999"
        self.isAutomatic = true
        self.isCavok = false
        self.isWindVariable = false
        self.windSpeed = "000"
        self.windDirection = "000"
        self.windBetweenFrom = "000"
        self.windBetweenTo = "000"
        self.clouds = []
        self.windGust = "000"
        self.isWindGusting = false
        self.isWindVarialeBetween = false
        self.remarks = ""
    }

    // Computed properties
    var windDescription: String {
        if isWindVariable {
            return "Variable \(windSpeed)kt"
        }

        return "\(windSpeed)kt from \(windDirection)°"

    }
    var windVariabilityDescription: String {
        if !isWindVarialeBetween {
            return ""
        }
        return "\(windBetweenFrom)° <> \(windBetweenTo)°"
    }

    var updatedOnTime: String {
        return Date(
            fromString: updatedOn,
            format: .isoDateTimeFull
        )?
        .toString(format: .custom("HH:mm")) ?? ""
    }

}

extension RedhillAtis {
    func toDictionary() -> [String: Any] {
        return [
            "site": site,
            "metar": metar,
            "designator": designator,
            "runway": runway,
            "updatedOn": updatedOn,
            "qfe": qfe,
            "qnh": qnh,
            "isAutomatic": isAutomatic,
            "isCavok": isCavok,
            "temperature": temperature,
            "dewPoint": dewPoint,
            "visibility": visibility,
            "isWindVariable": isWindVariable,
            "windSpeed": windSpeed,
            "windDirection": windDirection,
            "windBetweenFrom": windBetweenFrom,
            "windBetweenTo": windBetweenTo,
            "windDescription": windDescription,
            "windVariabilityDescription": windVariabilityDescription,
        ]
    }
}
