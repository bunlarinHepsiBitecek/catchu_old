//
//  MenuBarCollectionViewCell.swift
//  catchu
//
//  Created by Erkut Baş on 8/12/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var baseView: UIView!
    @IBOutlet var menubarTitle: UILabel!
    
    override var isHighlighted: Bool {
        didSet {
            print("isHighlighted pressed")
//            menubarTitle.textColor = isHighlighted ? UIColor.black : UIColor.gray
            
            UIView.transition(with: menubarTitle, duration: 0.1, options: .curveEaseIn, animations: {
                self.menubarTitle.textColor = self.isHighlighted ? UIColor.black : UIColor.gray
            })
        }
    }
    
    override var isSelected: Bool {
        didSet {
            print("isSelected pressed")
            print("selected : \(isSelected)")
//            menubarTitle.textColor = isSelected ? UIColor.black : UIColor.gray
            
            UIView.transition(with: menubarTitle, duration: 0.1, options: .curveEaseIn, animations: {
                self.menubarTitle.textColor = self.isSelected ? UIColor.black : UIColor.gray
            })
            
        }
    }
    
}
