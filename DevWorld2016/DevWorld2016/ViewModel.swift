//
//  ViewModel.swift
//  DevWorld2016
//
//  Created by KA YI MAK on 12/07/2016.
//
//

import Foundation

typealias WeatherResultRow = [(title: String, description: String)]

struct ViewModel {
    let rows : WeatherResultRow
    init(results: [WeatherResult]) {
        self.rows = results.map { result in
            return (title: "\(result.suburb) - \(result.forecast)", description: result.temperature)
        }
    }
}
