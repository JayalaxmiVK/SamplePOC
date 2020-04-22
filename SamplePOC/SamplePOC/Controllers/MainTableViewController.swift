//
//  MainTableViewController.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Variables
    var varaiable = [Element]()
    var facts: CountryInfo?
    var activityIndicator = UIActivityIndicatorView()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //adding pull to refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshControl = refreshControl
        
        //configure activityIndicator
        configureActivityIndicator()
        
        //Get data from network class.
        getFactsData()
        
        //Registering the cell
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        
        //providing dynamic row size for the tableView cell depending on the cell content.
        tableView.estimatedRowHeight = CGFloat(100)
        tableView.rowHeight = UITableView.automaticDimension
        
        //Hiding empty cells at bottom of the tableview
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts?.rows.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as? MainTableViewCell
        cell?.element = facts?.rows[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Helper Methods
    func configureActivityIndicator() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = self.tableView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }
    @objc func refreshData() {
        //Clear data and reload tableview
        self.facts = CountryInfo(title: kEmptyString, rows: [Element]())
        self.tableView.reloadData()
        //Hit the fresh service call
        self.getFactsData()
    }
    
    // MARK: - Service Call
    func getFactsData() {
        self.addActivityIndicator()
        DataFactory.shared.getCountryData(completion: {[weak self] (info, error) in
            self?.removeActivityIndicator()
            self?.refreshControl?.endRefreshing()
            guard let data = info else {
                print(error?.localizedDescription as Any)
                return
            }
            self?.facts = data
            
            //removing the row which hastitle properties as nil &  reassigning
            let compactRowData = data.rows.filter {$0.title != nil}
            self?.facts?.rows = compactRowData
            
            //setting Navigation controller title
            self?.navigationItem.title = self?.facts?.title
            
            //reload tableview after receiving data from backend
            self?.tableView.reloadData()
        })
    }
        
    // MARK: - ADD/Remove Activity Indicator
    func addActivityIndicator() {
        self.tableView.addSubview(activityIndicator)
        activityIndicator.bringSubviewToFront(self.tableView)
        activityIndicator.startAnimating()
    }
    
    func removeActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
