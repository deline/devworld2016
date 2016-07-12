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
    private let service: WeatherService
    weak var viewPort: ViewPort?
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func viewDidLoadEvent() {
        service.weatherForSuburbs(["Maroubra", "Bondi", "Baulkham Hills"]) {
            results in
            
            let viewModel = ViewModel(results: results)
            
            self.viewPort?.refreshWithResult(viewModel: viewModel)
        }
    }
    
    func didSelectRowAt(indexPath: NSIndexPath) {
        self.viewPort?.presentSecondController()
    }
}
