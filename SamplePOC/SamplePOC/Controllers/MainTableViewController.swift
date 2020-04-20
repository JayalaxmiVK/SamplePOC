//
//  MainTableViewController.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    var products = [CountryInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FIRST"
        createProductArray()
        
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
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! MainTableViewCell
        let currentElement = products[indexPath.row]
        cell.countryInfo = currentElement
        return cell
    }
    
    // MARK: - Helper Methods
    func createProductArray() {
        products.append(CountryInfo(title: "Canada", element: Element(elementName: "Animal", elementImage: UIImage(), elementDesc: "Nice One")))
        products.append(CountryInfo(title: "Canada", element: Element(elementName: "Animal", elementImage: UIImage(), elementDesc: "Nice One")))
        products.append(CountryInfo(title: "Canada", element: Element(elementName: "Animal", elementImage: UIImage(), elementDesc: "Nice One my name is Jayalaxmi, an ios Developer with four years of expireince in ios development having completed engineering in information science and technology in 2009, at pojjya doddappa appa collage of engineering, gulbarga")))
        products.append(CountryInfo(title: "Canada", element: Element(elementName: "Animal", elementImage: UIImage(), elementDesc: "A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.")))
        
    }
}
