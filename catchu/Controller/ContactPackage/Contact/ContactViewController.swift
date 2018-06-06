//
//  ContactViewController.swift
//  catchu
//
//  Created by Erkut Baş on 6/3/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import FirebaseFunctions

class ContactViewController: UIViewController {

    @IBOutlet var contactView: ContactView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactView.referenceMasterViewController = self
        
        prepareViewLoadProcess()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


