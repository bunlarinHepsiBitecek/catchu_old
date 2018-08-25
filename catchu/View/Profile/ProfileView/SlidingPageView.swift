//
//  SlidingPageView.swift
//  catchu
//
//  Created by Erkut Baş on 8/14/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class SlidingPageView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var menuBarReference = MenuBarView()
    
    func initialize() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        
    }
    
    func takasiBomba() {
        
        print("BOMBA BOMBA BOMBA")
        
    }
    
    func changeFlowLayoutSize(input : CGFloat) {
        
        collectionViewFlowLayout.itemSize = CGSize(width: 375, height: input)
        
        collectionView.reloadData()
 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slidingCell", for: indexPath) as! SlidingPageCollectionViewCell
        
        let colors : [UIColor] = [UIColor.black, UIColor.green, UIColor.orange, UIColor.red]
        
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.frame.width, height: self.frame.height)

    }
    
    // sliding page ile menuBar daki slidebari yonetmek icin kullandik
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("----> :\(scrollView.contentOffset.x)")
        
        menuBarReference.slidingBarViewLeftAnchor.constant = scrollView.contentOffset.x / 4
        
    }
    
    // sliding page ile menubardaki collection view cell in selected higlihted secenegini yonetmek icin kullanacagiz
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        
        let index = targetContentOffset.pointee.x / self.frame.width
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        menuBarReference.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
    }
    
    func scrollCollectionViewToIndex(inputMenuIndex : Int) {
        
        let scrollIndex = IndexPath(item: inputMenuIndex, section: 0)
        
        collectionView.scrollToItem(at: scrollIndex, at: .centeredHorizontally, animated: true)
        
    }

}
