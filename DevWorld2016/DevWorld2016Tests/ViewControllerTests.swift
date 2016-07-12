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
        let viewController = ViewController(service: ServiceStub())
        
        viewController.viewDidLoad()
        
        let numberOfRows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(numberOfRows == 3)
        XCTAssert(firstCell.textLabel?.text == "Maroubra - Cloudy")
    }

    func testClickingACellPresentsSecondController() {
        let viewController = ViewController(service: ServiceStub())
        UIApplication.shared().keyWindow?.rootViewController = viewController
        
        viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        let secondController = viewController.presentedViewController
        print(secondController)
        
        XCTAssert(secondController?.title == "Second controller")
    }
    
    // Testing viewAdapter
    
    func testViewDidLoadEvent() {
        let viewPort = ViewPortSpy()
        let viewAdapter = ViewAdapter(service: ServiceStub(), viewPort: viewPort)
        
        viewAdapter.viewDidLoadEvent()
        
        XCTAssertNotNil(viewPort.viewModel)
        XCTAssert(viewPort.viewModel?.rows.count == 3)
        XCTAssert(viewPort.viewModel?.rows[0].title == "Maroubra - Cloudy")
    }
    
    func testDidSelectIndexPathEvent() {
        let viewPort = ViewPortSpy()
        let viewAdapter = ViewAdapter(service: ServiceStub(), viewPort: viewPort)
        
        viewAdapter.didSelectRowAt(indexPath: NSIndexPath(row: 0, section: 0))
        
        XCTAssertTrue(viewPort.presentedSecondController)
    }
}

struct ServiceStub : ServiceProtocol {
    func weatherForSuburbs(_ suburbs: [String], success: (result: [WeatherResult]) -> Void) {
        let weatherResult = WeatherResult(suburb: "Maroubra")
        success(result: [weatherResult, weatherResult, weatherResult])
    }
}

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
