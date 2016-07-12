//
//  ViewController.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import UIKit

typealias WeatherResultRow = [(title: String, description: String)]

struct ViewModel {
    let rows : WeatherResultRow
}

protocol ViewPort {
    func refreshWithResult(viewModel: ViewModel)
    func presentSecondController()
}

struct ViewAdapter {
    private let service: ServiceProtocol
    private let viewPort: ViewPort
    
    init(service: ServiceProtocol, viewPort: ViewPort) {
        self.service = service
        self.viewPort = viewPort
    }
    
    func viewDidLoadEvent() {
        service.weatherForSuburbs(["Maroubra", "Bondi", "Baulkham Hills"]) {
            results in

            let rows = results.map { result in
                return (title: "\(result.suburb) - \(result.forecast)", description: result.temperature)
            }
            let viewModel = ViewModel(rows: rows)
            
            self.viewPort.refreshWithResult(viewModel: viewModel)
        }
    }
    
    func didSelectRowAt(indexPath: NSIndexPath) {
        self.viewPort.presentSecondController()
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewPort {
    let tableView = UITableView()
    private (set) var viewModel: ViewModel?
    private var viewAdapter : ViewAdapter!
    
    init(service: ServiceProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewAdapter = ViewAdapter(service: service, viewPort: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewAdapter = ViewAdapter(service: Service(), viewPort: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear()
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        viewAdapter.viewDidLoadEvent()
    }
    
    func refreshWithResult(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        assert((indexPath as NSIndexPath).row < viewModel?.rows.count)
        
        let result = viewModel!.rows[(indexPath as NSIndexPath).row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        cell.textLabel?.text = result.title
        cell.detailTextLabel?.text = result.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewAdapter.didSelectRowAt(indexPath: indexPath)
    }
    
    func presentSecondController() {
        self.present(SecondController(), animated: true, completion: nil)
    }
}




