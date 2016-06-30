//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

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
        
        self.view.backgroundColor = .clearColor()
        
        let tableView = UITableView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)), style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        service.weatherForSuburbs(["Maroubra", "Bondi", "Baulkham Hills"]) {
            [unowned self](result) in
            self.weatherReport = result
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        assert(indexPath.row < weatherReport?.count)
        
        let result = weatherReport![indexPath.row]
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "")
        cell.textLabel?.text = "\(result.suburb) - \(result.forecast)"
        cell.detailTextLabel?.text = result.temperature
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherReport?.count ?? 0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.presentViewController(SecondController(), animated: true, completion: nil)
    }
}

struct Service {
    func weatherForSuburbs(suburbs: [String], success: (result: [WeatherResult]) -> Void) {
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
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertNotNil(viewController.weatherReport)
        XCTAssert(numberOfRows == 3)
        XCTAssert(firstCell.textLabel?.text == "Maroubra - Cloudy")
    }
    
    func testClickingACellDoesSomething() {
        let viewController = ViewController()
        
        viewController.viewDidLoad()
        
//        let firstCell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
//        
//        viewController.tableView(viewController.tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
    }
}

//MyTests()

// live view


let container = ViewController()
XCPlaygroundPage.currentPage.liveView = container
