//
//  TableViewController.swift
//  Customizing_Header_and_Footer_TableView
//
//  Created by DuyCuong on 8/22/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var countriesinEurope = ["France", "Spain", "Germany"]
    
    var countriesinAsia = ["Japan", "China", "India"]
    
    var countriesInSouthAmerica = ["Argentina", "Brasil", "Chile"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
        
        // 3
        // Configure the cell...
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = countriesinEurope[indexPath.row]
        case 1:
            cell.textLabel?.text = countriesinAsia[indexPath.row]
        case 2:
            cell.textLabel?.text = countriesInSouthAmerica[indexPath.row]
        //return sectionHeaderView
        default:
            cell.textLabel?.text = "Other"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColor.cyan
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Europe";
        //return sectionHeaderView
        case 1:
            headerCell.headerLabel.text = "Asia";
        //return sectionHeaderView
        case 2:
            headerCell.headerLabel.text = "South America";
        //return sectionHeaderView
        default:
            headerCell.headerLabel.text = "Other";
        }
        
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        footerView.backgroundColor = UIColor.black
        
        return footerView
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

}
