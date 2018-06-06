//
//  CloudFunctionsManager.swift
//  catchu
//
//  Created by Erkut Baş on 6/1/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import FirebaseFunctions

class CloudFunctionsManager {
    
    public static let shared = CloudFunctionsManager()
    
    func createUserProfileModel() {
        
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
    
    // function below uses singleton user object
    func updateUserProfileModel() {
        
        User.shared.toString()
        
        let function = Functions.functions()
        
        let data = User.shared.createUserDataDictionary()
        
        function.httpsCallable(Constants.FirebaseCallableFunctions.updateUserProfile).call(data) { (httpResult, error) in
            
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
    
    // function below updates specific childs of Profile unique nodes according to data 
    func updateUserProfileModelWithData(data: NSDictionary) {
        
        User.shared.toString()
        
        let function = Functions.functions()
        
        function.httpsCallable(Constants.FirebaseCallableFunctions.updateUserProfile).call(data) { (httpResult, error) in
            
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
    
    func getFriends() {
        
        User.shared.toString()
        
        let function = Functions.functions()
        
        function.httpsCallable(Constants.FirebaseCallableFunctions.getFriends).call { (httpResult, error) in
           
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    print("errorCode : \(errorCode.localizedDescription)")
                    print("errorCode : \(errorCode.userInfo)")
                    
                }
                
            } else {
                
                User.shared.appendElementIntoFriendList(httpResult: httpResult!)
                
            }
        }
        
        
    }
    
}
