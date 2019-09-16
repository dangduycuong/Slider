//
//  HomeViewController.swift
//  DemoSideMenu
//
//  Created by Cuong on 9/13/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func sideMenuView() {
        view.addSubview(workingSelectionView)
        workingSelectionView.fill(left: 0, top: 0, right: 0, bottom: -100)
        workingSelectionView.alpha = 0
        workingSelectionView.closure = { [weak self] workingType in
            self?.selectedWorkingType = workingType
        }
    }
    
    @IBAction func onClickSelectedWorkingType(_ sender: UIButton) {
        workingSelectionView.toggle()
        sender.isSelected = !sender.isSelected
    }
}

class HomeViewController: UIViewController {
    
    @IBOutlet var workingSelectionView: WorkingSelectionView!
    
    @IBOutlet weak var selectedWorkingTypeContainerView: UIView!
    
    var selectedWorkingType: WorkingType? {
        didSet {
            if let workingtype = selectedWorkingType {
                selectedWorkingTypeContainerView.backgroundColor = UIColor.green
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView()

    }

    override func viewDidAppear(_ animated: Bool) {
        workingSelectionView.isOpen = false
    }
    
}


