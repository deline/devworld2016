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
        let viewController = ViewController()
        
        viewController.viewDidLoad()
        
        let numberOfRows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertNotNil(viewController.weatherReport)
        XCTAssert(numberOfRows == 3)
        XCTAssert(firstCell.textLabel?.text == "Maroubra - Cloudy")
    }

    func testClickingACellPresentsSecondController() {
        UIApplication.sharedApplication().delegate?.application!(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil)
        
        let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController as! ViewController
        print(rootViewController)
        
        rootViewController.tableView(rootViewController.tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))

        let secondController = rootViewController.presentedViewController
        print(secondController)
        
        XCTAssert(secondController?.title == "Second controller")
    }
    
}