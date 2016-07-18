//
//  ViewAdapter.swift
//  DevWorld2016
//
//  Created by KA YI MAK on 12/07/2016.
//
//

import Foundation

protocol ViewPort : class {
    func refreshWithResult(viewModel: ViewModel)
    func presentSecondController()
}

struct ViewAdapter {
    private let service: PokemonSearchService
    weak var viewPort: ViewPort?
    
    init(service: PokemonSearchService) {
        self.service = service
    }
    
    func viewDidLoadEvent() {
        service.suburbsContaining(pokemon: ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon"]) {
            results in
            
            let viewModel = ViewModel(results: results)
            self.viewPort?.refreshWithResult(viewModel: viewModel)
        }
    }
    
    func didSelectRowAt(indexPath: NSIndexPath) {
        self.viewPort?.presentSecondController()
    }
}
