//
//  PokemonSearchService.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import Foundation

protocol PokemonSearchService {
    func suburbsContaining(pokemon: [String], success: (result:[SearchResult]) -> Void)
}

struct Service: PokemonSearchService {

    let suburbs = ["Maroubra", "Bondi", "Baulkham Hills", "Pyrmont", "Alexandria", "Ryde", "Hornsby"]

    func suburbsContaining(pokemon: [String], success: (result:[SearchResult]) -> Void) {
        let results = pokemon.map { pokemon in
            return SearchResult(pokemon: pokemon, suburbsPresent: randomSuburbs())
        }
        success(result: results)
    }

    private func randomSuburbs() -> [String] {
        let countOfSuburbsToInclude = Int(arc4random_uniform(UInt32(self.suburbs.count)))
        var suburbs = [String]()
        if (countOfSuburbsToInclude != 0) {
            for index in 1...countOfSuburbsToInclude {
                suburbs.append(self.suburbs[index])
            }
        }
        

        return suburbs
    }

}
