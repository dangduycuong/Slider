//
//  TableViewController.swift
//  ActionsTableView
//
//  Created by DuyCuong on 8/26/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let apps = ["Minecraft","Facebook","Tweetbot","Instagram"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return apps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = apps[indexPath.row]

        return cell
    }
    

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let sharedAction = UITableViewRowAction(style: .default, title: "Shared", handler: { (action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let sharedMenu = UIAlertController(title: nil, message: "shared using", preferredStyle: .actionSheet)
        
            let twitterAction = UIAlertAction(title: "Twitter", style: .default, handler: nil)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            sharedMenu.addAction(twitterAction)
            sharedMenu.addAction(cancelAction)
            self.present(sharedMenu, animated: true, completion: nil)
        })
        
        let rateAction = UITableViewRowAction(style: .default, title: "Rate", handler: { (action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let rateMenu = UIAlertController(title: nil, message: "Rate this App", preferredStyle: .actionSheet)
            let appRateAction = UIAlertAction(title: "Rate", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            rateMenu.addAction(appRateAction)
            rateMenu.addAction(cancelAction)
            
            self.present(rateMenu, animated: true, completion: nil)
        })
        
        return [sharedAction, rateAction]
    }

}
