//
//  RegisterViewController.swift
//  catchu
//
//  Created by Erkut Baş on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

class RegisterViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    var pool : AWSCognitoIdentityUserPool?
    var sentTo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerUserPool()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
        registerUser()
        
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        FirebaseManager.shared.logout()
    }

    @IBAction func gotoMain(_ sender: Any) {
        
        if let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TemporaryViewController") as? TemporaryViewController {
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
        
    }
}
