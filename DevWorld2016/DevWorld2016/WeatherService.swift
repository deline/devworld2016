//
//  WeatherService.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import Foundation

protocol WeatherService {
    func weatherForSuburbs(_ suburbs: [String], success: (result: [WeatherResult]) -> Void)
}

struct Service : WeatherService {
    func weatherForSuburbs(_ suburbs: [String], success: (result: [WeatherResult]) -> Void) {
        let results = suburbs.map { suburb in
            return WeatherResult(suburb: suburb)
        }
        
        success(result: results)
        
    }
}
