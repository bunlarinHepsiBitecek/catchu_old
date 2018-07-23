//
//  ConfirmationViewController.swift
//  catchu
//
//  Created by Erkut Baş on 7/19/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

class ConfirmationViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var confirmationCode: UITextField!
    
    var sentTo: String?
    var user: AWSCognitoIdentityUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNecessaryFields()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        
        let strongSelf = self
        
        guard let confirmationCodeValue = confirmationCode.text, !(confirmationCode.text?.isEmpty)! else
        {
            
            AlertViewManager.shared.createAlert_2(title: LocalizedConstants.Warning, message: LocalizedConstants.AWSError.confirmationCodeRequired, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
            
            return
            
        }
        
        self.user?.confirmSignUp(confirmationCode.text!).continueWith(block: { (task) -> Any? in
            
            DispatchQueue.main.async(execute: {
                
                if task.error != nil {
                    
                    if let error = task.error as NSError? {
                        
                        print("errorCode : \(error.code)")
                        
                        AlertViewManager.shared.createAlert_2(title: LocalizedConstants.Error, message: LocalizedConstants.AWSError.confirmationFailed, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                        
                    }
                    
                } else {
                    
                    let _ = strongSelf.navigationController?.popToRootViewController(animated: true)

                    
                }
                
            })
            
        })
        
        
        
        
    }
    
    @IBAction func resendButtonTapped(_ sender: Any) {
        
        self.user?.resendConfirmationCode().continueWith(block: { (task) -> Any? in
            
            if task.error != nil {
                
                print("error : \(task.error?.localizedDescription)")
                
            } else if let result = task.result {
                
                print("resend is ok")
                
            }
            
            return nil
            
        })
        
    }
    
    func setNecessaryFields() {
        
        userName.text = user?.username
        userName.isEnabled = false
        
    }
    

}
