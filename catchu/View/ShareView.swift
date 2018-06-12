//
//  ShareView.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 6/9/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import Photos

class ShareView: UIView {
    
    //MARK: outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func accessPhotos() {
        MediaLibraryManager.shared.loadPhotos { (assets) in
            if assets.count > 0 {
                self.collectionView.delegate = self
                self.collectionView.dataSource = self
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: selected first image
    private func selectDefaultImage(){
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .top)
    }
    
    @IBAction func photosButtonClicked(_ sender: UIButton) {
        self.accessPhotos()
        if (self.textField.isEditing) {
            self.textField.endEditing(true)
        }
    }
    
    @IBAction func cameraButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func dropPinButtonClicked(_ sender: UIButton) {
    }
}

extension ShareView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MediaLibraryManager.shared.assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:ShareCollectionViewCell = collectionView.cellForItem(at: indexPath) as! ShareCollectionViewCell
        cell.isSelected = true
    }
}

extension ShareView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ShareCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.ShareCollectionViewCell, for: indexPath) as! ShareCollectionViewCell
        cell.populateDataWith(asset: MediaLibraryManager.shared.assets[indexPath.item])
        return cell
    }
}

extension ShareView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.Cell.ShareCollectionViewCellWidht, height: Constants.Cell.ShareCollectionViewCellHeight)
    }
}





