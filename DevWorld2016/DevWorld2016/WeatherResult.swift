//
//  WeatherResult.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import Foundation

struct WeatherResult {
    let suburb: String
    let forecast = "Cloudy"
    let temperature = "0 C"
    
    init(suburb: String) {
        self.suburb = suburb
    }
}
