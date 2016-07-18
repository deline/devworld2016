//
//  ViewAdapterTest.swift
//  DevWorld2016
//
//  Created by Deline Neo on 18/07/2016.
//
//

import XCTest
@testable import DevWorld2016

class ViewAdapterTest: XCTestCase {

    func testViewDidLoadEvent() {
        let viewPort = ViewPortSpy()
        var viewAdapter = ViewAdapter(service: PokemonSearchServiceStub())
        viewAdapter.viewPort = viewPort

        viewAdapter.viewDidLoadEvent()

        XCTAssertNotNil(viewPort.viewModel)
        XCTAssert(viewPort.viewModel?.rows.count == 3)
        XCTAssert(viewPort.viewModel?.rows[0].title == "Maroubra - Cloudy")
    }

//    func testDidSelectIndexPathEvent() {
//        let viewPort = ViewPortSpy()
//        var viewAdapter = ViewAdapter(service: PokemonSearchServiceStub())
//        viewAdapter.viewPort = viewPort
//
//        viewAdapter.didSelectRowAt(indexPath: NSIndexPath(row: 0, section: 0))
//
//        XCTAssertTrue(viewPort.presentedSecondController)
//    }

}
