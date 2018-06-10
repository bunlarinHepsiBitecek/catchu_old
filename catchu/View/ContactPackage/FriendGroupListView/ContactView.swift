//
//  ContactView.swift
//  catchu
//
//  Created by Erkut Baş on 6/4/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ContactView: UIView {
    
    @IBOutlet var containerViewFriend: UIView!
    @IBOutlet var containerGroup: UIView!
    @IBOutlet var topView: UIView!
    
    var referenceMasterViewController : ContactViewController!

    func initializeView() {
        
        self.topView.alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            
            self.topView.alpha = 1.0
            
            
        }
        
        self.containerViewFriend.alpha = 1.0
        self.containerGroup.alpha = 0.0
        
        
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    
        referenceMasterViewController.dismiss(animated: true, completion: nil)
        
    }
    
    
}
