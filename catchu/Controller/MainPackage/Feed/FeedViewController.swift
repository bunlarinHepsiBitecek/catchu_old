//
//  FeedViewController.swift
//  catchu
//
//  Created by Erkut Baş on 7/18/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

class FeedViewController: UIViewController {

    var user: AWSCognitoIdentityUser?
    var pool: AWSCognitoIdentityUserPool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchUserDetails()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchUserDetails() {
        
        self.pool = AWSCognitoIdentityUserPool(forKey: Constants.CognitoConstants.AWSCognitoUserPoolsSignInProviderKey)
        
        if (self.user == nil) {
            self.user = self.pool?.currentUser()
        }
        
        user?.getDetails().continueOnSuccessWith(block: { (task) -> Any? in
            
            return nil
            
        })
        
    }

}
