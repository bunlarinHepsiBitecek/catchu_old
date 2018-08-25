//
//  Zala.swift
//  catchu
//
//  Created by Erkut Baş on 8/15/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class Zala: UIView {

    @IBOutlet var scrollView: UIScrollView!
    
    func initialize() {
        
        scrollView.contentSize = CGSize(width: 375, height: 1000)
        
    }
    
    

}
