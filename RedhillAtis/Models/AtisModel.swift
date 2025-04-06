//
//  AtisModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import Foundation

struct RedhillAtis: Decodable {
    var site: String
    var metar: String
    var designator: String
    var runway: String
    var updatedOn: String
    var qfe: String
    var qnh: String
    //    var isAutomatic: Bool
    //    var isCavok: Bool
    //    var temperature: Int
    //    var dewPoint: Int
    //    var visibility: Int
    //    var clouds: [CloudCoverage]
    //    var isWindVariable: Bool
    //    var windSpeed: Int
    //    var windBetweenFrom: Int
    //    var windDirection: Int
    //    var windBetweenTo: Int
    //    var windSpeedGust: Int
    //    var weather: String
    //
    //    struct CloudCoverage: Decodable {
    //        var type: Int = 0
    //        var height: Int = 0
    //        var cover: Int = 0
    //    }
    

    init() {
        self.site = ""
        self.metar = ""
        self.designator = "-"
        self.runway = "00-"
        self.updatedOn = "2025-01-01T00:00:00.000+00:00"
        //        self.isAutomatic = true
        //        self.isCavok = true
        self.qfe = "0000"
        self.qnh = "0000"
        //        self.temperature = 0
        //        self.dewPoint = 0
        //        self.visibility = 0
        //        self.clouds = []
        //        self.isWindVariable = false
        //        self.windSpeed = 0
        //        self.windDirection = 0
        //        self.windBetweenFrom = 0
        //        self.windBetweenTo = 0
        //        self.windSpeedGust = 0
        //        self.weather = ""
    }
}
