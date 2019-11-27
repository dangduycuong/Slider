//
//  SubPageViewVC.swift
//  UISwitchDemo
//
//  Created by Đặng Duy Cường on 11/26/19.
//  Copyright © 2019 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class SubPageViewVC: BasePageViewVC {
    //MARK: Properties
    
    @IBOutlet weak var itemButtonBar1: UIButton!
    @IBOutlet weak var itemButtonBar2: UIButton!
    
    @IBOutlet weak var viewUnder1: UIView!
    @IBOutlet weak var viewUnder2: UIView!
    
    @IBOutlet weak var viewBasePageView: UIView!
    
    var vFirst = BasePageViewVC()
    var vTwo = BasePageViewVC()
    
    func makeView() -> [BasePageViewVC] {
        vFirst = Lane360SuCoVC(nibName: "Lane360SuCoVC", bundle: nil)
//        vFirst.detailInfoCableLane = self.detailInfoCableLane
        
        vTwo = TuanTraTuyenCapVC(nibName: "TuanTraTuyenCapVC", bundle: nil)
//        vTwo.detailInfoCableLane = self.detailInfoCableLane
        vTwo.indexPage = 1
        
        return [vFirst, vTwo]
    }
    
    
    //Action handle
    var lastIndexSelected = 0
    var currentIndexSelected = 0 {
        willSet {
            self.lastIndexSelected = self.currentIndexSelected
        }
        didSet {
            self.switchView()
            self.tabBar(didSelect: currentIndexSelected)
        }
    }
    
    var viewControllers : [BasePageViewVC] = []
    var pageView = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVC()
        
        self.setupPageView()
        self.tabBar(didSelect: 0)
    }
    
    func setupVC(){
        self.viewControllers = self.makeView()
    }
    
    func setupPageView(){
        self.pageView = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageView.dataSource = self
        self.pageView.delegate = self
        self.pageView.willMove(toParent: self)
        self.addChild(self.pageView)
        self.viewBasePageView.addSubview(self.pageView.view)
        self.pageView.view.frame.size = self.viewBasePageView.frame.size
        self.pageView.didMove(toParent: self)
        let viewcontroller = self.makePageVC(index: 0)
        self.pageView.setViewControllers([viewcontroller], direction: .forward, animated: false, completion: nil)
    }
    
    
    //Tabbar Action
    @IBAction func buttonActionItem1(_ sender: Any) {
        self.currentIndexSelected = 0
        
    }
    
    @IBAction func buttonActionItem2(_ sender: Any) {
        self.currentIndexSelected = 1
        
    }
    
}

extension SubPageViewVC {
    func tabBar(didSelect item: Int) {
        let colorNormal = UIColor.clear
        switch item {
        case 0:
            self.itemButtonBar1.setTitleColor(.red, for: .normal)

            self.itemButtonBar2.setTitleColor(.white, for: .normal)

            self.viewUnder1.backgroundColor = UIColor.red

            self.viewUnder2.backgroundColor = colorNormal
        case 1:
            self.itemButtonBar1.setTitleColor(.white, for: .normal)

            self.itemButtonBar2.setTitleColor(.red, for: .normal)

            self.viewUnder1.backgroundColor = colorNormal

            self.viewUnder2.backgroundColor = .red
        default:
            break
        }
    }
    
    func switchView(){
        if self.currentIndexSelected > self.lastIndexSelected {
            self.pageView.setViewControllers([self.makePageVC(index: self.currentIndexSelected)], direction: .forward, animated: true, completion: nil)
        } else if self.currentIndexSelected < self.lastIndexSelected {
            self.pageView.setViewControllers([self.makePageVC(index: self.currentIndexSelected)], direction: .reverse, animated: true, completion: nil)
        }
        
        switch currentIndexSelected {
        case 0:
            let temp = vFirst as! Lane360SuCoVC
            temp.titleVC = "Lane360"
            break
            //        case 1:
            //            let temp = vTwo as! TuanTraTuyenCapVC
            //            textFieldStartDate.text = temp.startDate
            //            textFieldEndDate.text = temp.endDate
            
        default:
            let temp = vTwo as! TuanTraTuyenCapVC
            temp.recivedData = "nothing"
        }
    }
}

//Page View
extension SubPageViewVC {
    func makePageVC(index: Int) -> BasePageViewVC {
        var indexPage = 0
        if index == self.viewControllers.count {
            indexPage = 0
        } else if index == -1 {
            indexPage = self.viewControllers.count - 1
        } else {
            indexPage = index
        }
        
        return self.viewControllers[indexPage]
    }
}

extension SubPageViewVC: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        self.currentIndexSelected = (pageViewController.viewControllers?.first as! BasePageViewVC).indexPage
//        self.tabBar(didSelect: (pageViewController.viewControllers?.first as! BasePageViewVC).indexPage )
    }
}

extension SubPageViewVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return self.makePageVC(index: (viewController as! BasePageViewVC).indexPage - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return self.makePageVC(index: (viewController as! BasePageViewVC).indexPage + 1)
    }
}



