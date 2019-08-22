//
//  ViewController.swift
//  Slider
//
//  Created by DuyCuong on 8/22/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(slider.value)
        label.text = String(currentValue)
    }
    
}

