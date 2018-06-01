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
                                
                            }
                            
                        })
                        
                        
                        
                    }
                    
                }
                
            }
            
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
        
        let user = User()
        
        if let userName = userNameTextField.text as String? {
            if !userName.isEmpty {
                user.userName = userName
            }
        }
        
        if let email = emailTextField.text as String? {
            if !email.isEmpty {
                user.email = email
            }
        }
        
        if let password = passwordTextField.text as String? {
            if !password.isEmpty {
                user.password = password
            }
        }
        
        user.toString()
        
        registerFirebase(user: user)
        
    }
    
    func cloudFunctionTest() {
        
        let functions = Functions.functions()
        
        functions.httpsCallable("helloWorld2").call(["text": "erkut"]) { (httpResult, error) in
            
            print("httpResult :\(String(describing: httpResult))")
            print("errorCode :\(error)")
            
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    print("errorCode :\(errorCode.localizedDescription)")
                    print("errorCode :\(errorCode)")
                    
                }
                
            } else {
                
                print("cloudFunction call is ok!")
                print("httpResult :\(String(describing: httpResult))")
                
                if let result = httpResult?.data {
                    print("result :\(String(describing: result))")

                       
                }
                
//                let json = try? JSONSerialization.jsonObject(with: httpResult?.data, options: [])
                //let json = try? JSONSerialization.jsonObject(with: httpResult?.data, options: [])
                
                
                let data : Data = httpResult?.data as! Data
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                print("json :\(json)")

                
                
                
            }
            
        }
        
//        functions.httpsCallable("helloWorld2").call { (httpResult, error) in
//            
//            print("httpResult :\(String(describing: httpResult))")
//            print("errorCode :\(error)")
//
//            
//            if error != nil {
//                
//                if let errorCode = error as NSError? {
//                    
//                    print("errorCode :\(errorCode.localizedDescription)")
//                    print("errorCode :\(errorCode)")
//                    
//                }
//                
//            } else {
//                
//                print("cloudFunction call is ok!")
//                print("httpResult :\(String(describing: httpResult))")
//                
//            }
//            
//        }
        
    }
    
    func t() {
        
        let url = URL(string: "https://us-central1-catchu-594ca.cloudfunctions.net/helloWorld")
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, resp, error) in
            
            print("resp :\(String(describing: resp))")
            print("data :\(String(describing: data))")
            
            if let data = String(data: data!, encoding: String.Encoding.ascii) {
                
                print("data :\(String(describing: data))")
                
                
            }
        
        }
        
        task.resume()
        
    }
    
    
}

