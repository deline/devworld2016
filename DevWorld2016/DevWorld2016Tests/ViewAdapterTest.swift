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
        XCTAssert(viewPort.viewModel?.rows.count == 5)
        XCTAssert(viewPort.viewModel?.rows[0].title == "Bulbasaur")
        XCTAssert(viewPort.viewModel?.rows[0].description == "Sydney, Melbourne")
    }
}
