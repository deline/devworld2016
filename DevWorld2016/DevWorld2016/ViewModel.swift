//
//  ViewModel.swift
//  DevWorld2016
//
//  Created by KA YI MAK on 12/07/2016.
//
//

import Foundation

typealias PokemonSearchResultRow = [(title: String, description: String)]

struct ViewModel {
    let rows : PokemonSearchResultRow
    init(results: [SearchResult]) {
        self.rows = results.map { result in
        return (title: "\(result.pokemon)", description: result.suburbsPresent.joined(separator: ", "))
        }
    }
}
