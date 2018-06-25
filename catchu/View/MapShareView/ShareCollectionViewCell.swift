//
//  ShareCollectionViewCell.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 6/9/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import Photos

class ShareCollectionViewCell: UICollectionViewCell {
    
    //  MARK: IBOutlets
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override var isSelected:Bool{
        didSet{
            if isSelected {
                selectionView.backgroundColor = .white
            }
            else{
                selectionView.backgroundColor = .clear
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if self.imageView != nil {
            imageView.image = nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewConfigurations()
    }
    
    private func viewConfigurations(){
        selectionView.layer.borderWidth = 2
        selectionView.layer.borderColor = UIColor.clear.cgColor
    }
    
    func populateDataWith(asset:PHAsset) {
        MediaLibraryManager.shared.imageFrom(asset: asset, size: Constants.MediaLibrary.ImageHolderSize) { (image) in
            DispatchQueue.main.async {
                if self.imageView != nil{
                    self.imageView.image = image
                }
            }
        }
    }
}
