//
//  ViewController.swift
//  Switch
//
//  Created by DuyCuong on 8/25/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var stateSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateSwitch.addTarget(self, action: #selector(stateChanged(switchState:)), for: .valueChanged)
    }
    
    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            textLabel.text = "The Switch is On"
        } else {
            textLabel.text = "The Switch is Off"
        }
    }


    @IBAction func buttonClicked(_ sender: Any) {
        if stateSwitch.isOn {
            textLabel.text = "The Switch is Off"
            stateSwitch.setOn(false, animated: true)
        } else {
            textLabel.text = "The Switch is On"
            stateSwitch.setOn(true, animated: true)
        }
    }
}

