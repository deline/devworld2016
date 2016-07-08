//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport

// View

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    let service = Service()
    var weatherReport: [WeatherResult]?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear()
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        service.weatherForSuburbs(["Maroubra", "Bondi", "Baulkham Hills"]) {
            [unowned self](result) in
            self.weatherReport = result
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        assert((indexPath as NSIndexPath).row < weatherReport?.count)
        
        let result = weatherReport![(indexPath as NSIndexPath).row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        cell.textLabel?.text = "\(result.suburb) - \(result.forecast)"
        cell.detailTextLabel?.text = result.temperature
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherReport?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        service.weatherForSuburbs(["Melbourne"]) {
            [unowned self](result) in
            
            self.weatherReport = result
            tableView.reloadData()
        }
    }
}

struct Service {
    func weatherForSuburbs(_ suburbs: [String], success: (result: [WeatherResult]) -> Void) {
        let results = suburbs.map { suburb in
            return WeatherResult(suburb: suburb)
        }
        
        success(result: results)
    }
}

struct WeatherResult {
    let suburb: String
    let forecast = "Cloudy"
    let temperature = "0 C"
    
    init(suburb: String) {
        self.suburb = suburb
    }
}

// Test

class MyTests : XCTestCase {
    
    func testViewControllerPopulatesTableCorrectly() {
        let viewController = ViewController()
        
        viewController.viewDidLoad()
        
        let numberOfRows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertNotNil(viewController.weatherReport)
        XCTAssert(numberOfRows == 3)
        XCTAssert(firstCell.textLabel?.text == "Maroubra - Cloudy")
    }
    
    func testClickingACellReloadsTable() {
        let viewController = ViewController()
        viewController.viewDidLoad()

        XCTAssert(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0) == 3)
        
        viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0) == 1)
    }
}

MyTests()

// live view


let container = ViewController()
XCPlaygroundPage.currentPage.liveView = container
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
