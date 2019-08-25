//
//  ViewController.swift
//  SegmentedControl
//
//  Created by DuyCuong on 8/25/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            textLabel.text = "First Segment Selected"
        case 1:
            textLabel.text = "Second Segment Selected"
        default:
            break
        }
    }
}

