//
//  DetailViewController.swift
//  PassDataViewController
//
//  Created by DuyCuong on 8/26/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedNumber: String!

    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = selectedNumber
    }

}
