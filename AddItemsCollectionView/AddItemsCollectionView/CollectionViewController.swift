//
//  CollectionViewController.swift
//  AddItemsCollectionView
//
//  Created by DuyCuong on 8/26/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    
    var modelData = ["Oliver","Harry","George","Jack","Noah"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return modelData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = modelData[indexPath.row]
        }
    
        return cell
    }

    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let name = "Cuong"
        modelData.append(name)
        let indexPath = IndexPath(row: modelData.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
    }

}
