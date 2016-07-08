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
        self.present(SecondController(), animated: true, completion: nil)
    }
}




