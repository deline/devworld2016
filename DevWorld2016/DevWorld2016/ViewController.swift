//
//  ViewController.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewPort {
    let tableView = UITableView()
    private (set) var viewModel: ViewModel?
    private var viewAdapter : ViewAdapter!
    
    init(service: PokemonSearchService) {
        super.init(nibName: nil, bundle: nil)
        self.viewAdapter = ViewAdapter(service: service)
        self.viewAdapter.viewPort = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewAdapter = ViewAdapter(service: Service())
        self.viewAdapter.viewPort = self
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
}




