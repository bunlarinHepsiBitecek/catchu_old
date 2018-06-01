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

extension RegisterViewController {
    
    func registerFirebase(user: User) {
        
        user.toString()
        
        LoaderController.shared.showLoader()
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (user, error) in
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    if let firebaseErrorCode = Firebase.AuthErrorCode(rawValue: errorCode.code){
                        
                        self.handleFirebaseErrorCodes(errorCode: firebaseErrorCode)
                        
                    }
                    
                }
                
            } else {
                
                if let user = user {
                    
                    if let userID = user.uid as String? {
                        
                        print("userID : \(userID)")
                        
                        Auth.auth().currentUser?.getIDToken(completion: { (result, error) in
                            
                            if error != nil {
                                
                                if let errorCode = error as NSError? {
                                    
                                    print("errorCode :\(errorCode.localizedDescription)")
                                    
                                }
                                
                            } else {
                                
                                print("result :\(String(describing: result))")
                                self.createUserProfileModel(userID: userID)
                                
                            }
                            
                        })
                        
                    }
                    
                }
                
            }
            
            LoaderController.shared.removeLoader()
        }
        
    }
    
    func handleFirebaseErrorCodes(errorCode: AuthErrorCode) {
        
        switch errorCode {
        case .accountExistsWithDifferentCredential:
            AlertViewManager.shared.createAlert(title: "Error", message: "accountExistsWithDifferentCredential", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
            
        case .credentialAlreadyInUse:
            AlertViewManager.shared.createAlert(title: "Error", message: "accountExistsWithDifferentCredential", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
            
        case .emailAlreadyInUse:
            AlertViewManager.shared.createAlert(title: "Error", message: "accountExistsWithDifferentCredential", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
            
        case .invalidCredential:
            AlertViewManager.shared.createAlert(title: "Error", message: "accountExistsWithDifferentCredential", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
            
        case .invalidEmail:
            AlertViewManager.shared.createAlert(title: "Error", message: "accountExistsWithDifferentCredential", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
            
        case .userNotFound:
            AlertViewManager.shared.createAlert(title: "Error", message: "accountExistsWithDifferentCredential", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
            
        default:
            AlertViewManager.shared.createAlert(title: "Default", message: "bla bla", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
        }
        
    }
    
    func registerUser() {
        
        guard validateRequiredFields() else {
            
            return
        }
        
        registerFirebase(user: User.shared)
        
    }
    
    func createUserProfileModel(userID: String) {
        
        User.shared.userID = userID
        
        User.shared.toString()
        
        let function = Functions.functions()
        
        let data = User.shared.createUserDataDictionary()
        
        function.httpsCallable(Constants.FirebaseCallableFunctions.createUserProfile).call(data) { (httpResult, error) in
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    print("errorCode : \(errorCode.localizedDescription)")
                    print("errorCode : \(errorCode.userInfo)")
                    
                }
                
            } else {
                
                if let data = httpResult?.data {
                    
                    print("data : \(data)")
                    
                }
                
            }
            
        }
        
        print("data :\(data)")
    }
    
    func logout() {
        
        do
        {
            try Auth.auth().signOut()
            
            print("logout is ok")
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
            print("logout is failed")
        }
        
    }
    
}

struct Dog : Codable {
    let name: String
    let owner: String
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





















