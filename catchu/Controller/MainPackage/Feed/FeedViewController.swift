//
//  FeedViewController.swift
//  catchu
//
//  Created by Erkut Baş on 7/18/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import AWSAuthUI

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("self.navigationController! : \(self.navigationController!)")
        
        AWSManager.shared.startUserAuthenticationProcess(navigationController: self.navigationController!)
        
        //AWSManager.shared.showSignInView(navigationController: self.navigationController!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
