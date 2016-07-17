//
//  WeatherResult.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import Foundation

struct SearchResult {
    let pokemon: String
    let suburbsPresent: [String]
    
    init(pokemon: String, suburbsPresent: [String]) {
        self.pokemon = pokemon
        self.suburbsPresent = suburbsPresent
    }
}
