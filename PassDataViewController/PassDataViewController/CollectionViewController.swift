//
//  CollectionViewController.swift
//  PassDataViewController
//
//  Created by DuyCuong on 8/26/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    // Size of Item
    
    //set before
    let WIDTH_SCREEN = UIScreen.main.bounds.width
    let numberOfItems: CGFloat = 3
    let padding: CGFloat = 1
    
    let modelData = ["1","2","3","4","5","6","7","8","9"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return modelData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = modelData[indexPath.row]
        }
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            let index = collectionView.indexPathsForSelectedItems?.first
            detailVC.selectedNumber = modelData[(index?.row)!]
        }
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (WIDTH_SCREEN - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        return CGSize(width: itemSize, height: itemSize)
    }
    
    // Spacing Between Each Edge Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
    }
    
    // Spacing Between Rows Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    //    Spacing Between Colums Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
