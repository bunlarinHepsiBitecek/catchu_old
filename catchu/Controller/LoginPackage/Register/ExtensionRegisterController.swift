//
//  ExtensionRegisterController.swift
//  catchu
//
//  Created by Erkut Baş on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFunctions

import AWSCognitoIdentityProvider

extension RegisterViewController {
    
    func registerUser() {
        
        guard validateRequiredFields() else {
            
            return
        }
        
        //FirebaseManager.shared.registerFirebase(user: User.shared)
        
        signUpForAWSCognitoUserPool()
        
    }
    
    // aws cognito user pool registeration
    func registerUserPool() {
        
        self.pool = AWSCognitoIdentityUserPool.init(forKey: Constants.CognitoConstants.AWSCognitoUserPoolsSignInProviderKey)
        
    }
    
    func signUpForAWSCognitoUserPool() {
        
        let strongSelf = self
        
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        
        if let emailValue = self.emailTextField.text, !emailValue.isEmpty {
            let email = AWSCognitoIdentityUserAttributeType()
            email?.name = "email"
            email?.value = emailValue
            attributes.append(email!)
        }
        
        // sign up - register user to pool
        self.pool?.signUp(userNameTextField.text!, password: passwordTextField.text!, userAttributes: attributes, validationData: nil).continueWith(block: { (task) -> Any? in
            
            DispatchQueue.main.async(execute: {
                
                if let errorCode = task.error as NSError? {
                    
                    print("errorCode : \(errorCode.localizedDescription)")
                    
                } else if let result = task.result {
                    // handle the case where user has to confirm his identity via email / SMS
                    if result.user.confirmedStatus != AWSCognitoIdentityUserStatus.confirmed {
                        
                        strongSelf.sentTo = result.codeDeliveryDetails?.destination
                        strongSelf.performSegue(withIdentifier: Constants.Segue.confirmSignUpSegue, sender: nil)
                        
                    }
                    
                }
                
            })
            
            return nil
            
        })
        
    }
    
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationController = segue.destination as? ConfirmationViewController {
            
            destinationController.sentTo = self.sentTo
            destinationController.user = pool?.getUser(userNameTextField.text!)
            
        }
        
    }
    
}

// validation manager
extension RegisterViewController {
    
    func validateRequiredFields() -> Bool {
        
        let validateUserNameResult = Validation.shared.isUserNameValid(userName: userNameTextField.text!)
        
        if !validateUserNameResult.isValid {
            AlertViewManager.shared.createAlert(title: validateUserNameResult.title, message: validateUserNameResult.message, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            return false
        } else {
            
            if let userName = userNameTextField.text as String? {
                User.shared.userName = userName
            }
        }
        
        let validateEmailResult = Validation.shared.isValidEmail(email: emailTextField.text!)
        
        if !validateEmailResult.isValid {
            AlertViewManager.shared.createAlert(title: validateEmailResult.title, message: validateEmailResult.message, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            return false
        } else {
            
            if let email = emailTextField.text {
                User.shared.email = email
            }
            
        }
        
        let validatePasswordResult = Validation.shared.isValidPassword(password: passwordTextField.text!)
        
        if !validatePasswordResult.isValid {
            AlertViewManager.shared.createAlert(title: validatePasswordResult.title, message: validatePasswordResult.message, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            return false
        } else {
            
            if let password = passwordTextField.text {
                User.shared.password = password
            }
            
        }
        
        return true
        
    }
    
}




















