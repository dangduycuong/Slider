//
//  WorkingSelectionView.swift
//  DemoSideMenu
//
//  Created by Cuong on 9/13/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit


class WorkingSelectionView:  View, ToggleViewProtocol {
    var isOpen: Bool = false {
        didSet {
            
        }
    }
    
    @IBOutlet weak var controlConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var corverButton: UIButton!
    
    @IBOutlet weak var menu: UIView!
    
    var closeDistance: CGFloat = 0.0
    
    var showDistance: CGFloat = 0.0
    
    var view: UIView!
    
    var coverAlpha: CGFloat = 0.4
    
    @IBOutlet weak var selectionWorkingTypeButton: UIButton!
    
    @IBOutlet weak var effectView: UIVisualEffectView!
    
    
    var selectedWorkingType: WorkingType?
    
    var closure: ((WorkingType)-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view = self
        setupToggleView(distance: menu.frame.height + 100)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    @IBAction func toggle(_ sender: UIButton! = nil) {
        isOpen = !isOpen
        performToggle(isOpen: isOpen)
        UIView.animate(withDuration: 0.35) {
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }
    
}
