//
//  LoginViewController.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {
    
    //MARK: outlets
    @IBOutlet weak var emailText: DesignableUITextField!
    @IBOutlet weak var passwordText: DesignableUITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    // to authenticate login process done by user credentials (username and pasword)
    var passwordAuthenticationCompletion : AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.customization()
        self.localized()
        
        let navigationController = UINavigationController()
        
        
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
        print("self.navigationController?.isNavigationBarHidden : \(self.navigationController?.isNavigationBarHidden)")
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
        print("self.navigationController?.isNavigationBarHidden : \(self.navigationController?.isNavigationBarHidden)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        //self.login()
        self.signIn()
    }
    
    @IBAction func facebookButtonClicked(_ sender: UIButton) {
        self.loginWithFaceebook()
        
        
        
    }
    
    @IBAction func twitterButtonClicked(_ sender: UIButton) {
        self.loginWithTwitter()
    }
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        self.performSegueToRegisterView()
    }
    
    @IBAction func forgotPasswordButtonClicked(_ sender: UIButton) {
        self.performSegueToForgetPassword()
    }
    @IBAction func test(_ sender: Any) {
        
        let pool = AWSCognitoIdentityUserPool(forKey: Constants.CognitoConstants.AWSCognitoUserPoolsSignInProviderKey)
        let user = pool.currentUser()
        let task : AWSTask<AWSCognitoIdentityUserSession> = (user?.getSession())!
        
        print("token : \(task.result?.idToken?.tokenString)")
        
    }
}

