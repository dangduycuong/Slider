//
//  ViewController.swift
//  CustomizeNavigationBar
//
//  Created by DuyCuong on 8/22/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let navigation = self.navigationController?.navigationBar
        navigation?.barStyle = UIBarStyle.black
        navigation?.tintColor = UIColor.yellow
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Apple_Swift_Logo")
        
        navigationItem.titleView = imageView
    }

}

