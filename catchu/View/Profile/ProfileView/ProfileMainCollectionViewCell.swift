//
//  ProfileMainCollectionViewCell.swift
//  catchu
//
//  Created by Erkut Baş on 8/11/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ProfileMainCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var tabCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        
        self.tabCollectionView.delegate = self
        self.tabCollectionView.dataSource = self
        
    }
    
    
    
    var stringTest = ""
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabCell", for: indexPath) as? ProfileTabCollectionViewCell else {
            
            return UICollectionViewCell()
            
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    
}
