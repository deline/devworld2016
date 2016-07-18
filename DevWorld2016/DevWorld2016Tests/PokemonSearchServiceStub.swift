//
//  PokemonSearchServiceStub.swift
//  DevWorld2016
//
//  Created by Deline Neo on 18/07/2016.
//
//

import Foundation
@testable import DevWorld2016

struct PokemonSearchServiceStub: PokemonSearchService {
    func suburbsContaining(pokemon: [String], success: (result:[SearchResult]) -> Void) {
        let results = pokemon.map {
            return SearchResult(pokemon: $0, suburbsPresent: ["Sydney"])
        }
        
        success(result: results)
    }
}
