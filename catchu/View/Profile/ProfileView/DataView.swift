//
//  DataView.swift
//  catchu
//
//  Created by Erkut Baş on 8/10/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class DataView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var pagesCollections: UICollectionView!
    
    var master = ProfileViewController()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = pagesCollections.dequeueReusableCell(withReuseIdentifier: "pagesCell", for: indexPath)
        
        cell.contentView.addSubview(master.views[indexPath.row])
        
        return cell
        
    }
    

}
