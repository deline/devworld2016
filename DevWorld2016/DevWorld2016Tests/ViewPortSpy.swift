//
//  ViewPortSpy.swift
//  DevWorld2016
//
//  Created by Deline Neo on 18/07/2016.
//
//

import Foundation
@testable import DevWorld2016

class ViewPortSpy : ViewPort {
    private (set) var presentedSecondController = false
    private (set) var viewModel : ViewModel? = nil
    
    func refreshWithResult(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func presentSecondController() {
        presentedSecondController = true
    }
}
