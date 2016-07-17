//
//  DevWorld2016Tests.swift
//  DevWorld2016Tests
//
//  Created by development on 6/30/16.
//
//

import XCTest
@testable import DevWorld2016

class ViewControllerTests: XCTestCase {
    
    func testViewControllerPopulatesTableCorrectly() {
        let viewController = ViewController(service: PokemonSearchServiceStub())
        
        viewController.viewDidLoad()
        
        let numberOfRows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(numberOfRows == 3)
        XCTAssert(firstCell.textLabel?.text == "Maroubra - Cloudy")
    }

    func testClickingACellPresentsSecondController() {
        let viewController = ViewController(service: PokemonSearchServiceStub())
        UIApplication.shared().keyWindow?.rootViewController = viewController
        
        viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        let secondController = viewController.presentedViewController
        print(secondController)
        
        XCTAssert(secondController?.title == "Second controller")
    }
}




