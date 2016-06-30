//
//  ViewController.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    let service = Service()
    var weatherReport: [WeatherResult]?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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




