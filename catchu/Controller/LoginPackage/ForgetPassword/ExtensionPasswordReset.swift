//
//  ExtensionPasswordReset.swift
//  catchu
//
//  Created by Erkut Baş on 5/29/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import Firebase

extension PasswordResetViewController {
    
    func manageForegroundActions() {
        
        print("manageForegroundActions starts")
        let action = #selector(backToLoginViewController)
        
        NotificationCenter.default.addObserver(self, selector: action, name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
    }
    
    @objc func backToLoginViewController() {
        
        print("backToLoginViewController starts")
        
        performSegueToReturnBack()
        
        print("erkut")
        
//        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func resetPasswordWithEmail(email: String) {
        
        let actionCodeSetting = ActionCodeSettings.init()
        
        actionCodeSetting.url = URL(string: String(format: "passwordReset://catchu-594ca.firebaseapp.com?email=%@", email))

        actionCodeSetting.setIOSBundleID("com.uren.catchu")
        
        Auth.auth().sendPasswordReset(withEmail: email, actionCodeSettings: actionCodeSetting) { (error) in
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    if let firebaseErrorCode = Firebase.AuthErrorCode(rawValue: errorCode.code) {
                        
                        print("firebaseErrorCode :\(firebaseErrorCode)")
                        
                    }
                    
                }
                
            } else {
                
                print("PasswordReset process finished successfully")
                
            }
            
        }
        
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
