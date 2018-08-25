//
//  MenuBarView.swift
//  catchu
//
//  Created by Erkut Baş on 8/14/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class MenuBarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var slidingBarViewLeftAnchor: NSLayoutConstraint!
    @IBOutlet var slidiingBarView: UIView!
    
    lazy var slidingPageReference = SlidingPageView()
    
    func initialize() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    func selectFirstItemInCollectionView() {
        
        collectionView.performBatchUpdates(nil) { (result) in
            if result {
                let selectedFirstMenuBar = IndexPath(item: 0, section: 0)
                self.collectionView.selectItem(at: selectedFirstMenuBar, animated: false, scrollPosition: .centeredHorizontally)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.NumericConstants.INTEGER_FOUR
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menubarCell", for: indexPath) as! MenuBarCollectionViewCell
        
        cell.menubarTitle.text = "menu" + String(describing: indexPath.row)
        cell.menubarTitle.textColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("indexPathItem : \(indexPath.item)")
        
//        let x = CGFloat(indexPath.item) * frame.width / 4
//        slidingBarViewLeftAnchor.constant = x
//        
//        UIView.animate(withDuration: 0.3) {
//            self.layoutIfNeeded()
//        }
        
        slidingPageReference.scrollCollectionViewToIndex(inputMenuIndex: indexPath.item)
        
    }
    
    
}
