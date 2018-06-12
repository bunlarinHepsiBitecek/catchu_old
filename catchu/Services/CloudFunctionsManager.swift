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
    lazy var functions = Functions.functions()
    
    func createUserProfileModel(userID: String) {
        
        User.shared.userID = userID
        
        User.shared.toString()
        
        let data = User.shared.createUserDataDictionary()
        
        functions.httpsCallable(Constants.FirebaseCallableFunctions.createUserProfile).call(data) { (httpResult, error) in
            
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
    func updateUserProfileModel(userID: String) {
        
        User.shared.userID = userID
        
        User.shared.toString()
        
        let data = User.shared.createUserDataDictionary()
        
        //let data2 : NSDictionary = ["userId" : User.shared.userID, "userName" : User.shared.userName]
        
        functions.httpsCallable(Constants.FirebaseCallableFunctions.updateUserProfile).call(data) { (httpResult, error) in
            
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
    func updateUserProfileModelWithData(userID: String, data: NSDictionary) {
        
        User.shared.userID = userID
        
        User.shared.toString()
        
        functions.httpsCallable(Constants.FirebaseCallableFunctions.updateUserProfile).call(data) { (httpResult, error) in
            
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
    
    // MARK: sil
    func cfAddMessage() {
        let message = "Remzi kisa mesaj 3"
        // MARK: Firebase callable function always return json format, vise versa return INTERNAL error
        functions.httpsCallable("addMessage").call(["text": message]) { (result, error) in
            // [START function_error]
            print("cfAddMessage call edildi")
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FIRFunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    print("Remzi hata detay code:\(code) message:\(message) details:\(details)")
                }
                // [START_EXCLUDE]
                print(error.localizedDescription)
                return
                // [END_EXCLUDE]
            }
            // [END function_error]
            
            print("CF sonrasi datamIlk")
            if let datamIlk = (result?.data as? Data) {
                print("CF icerde datamIlk:\(datamIlk)")
                let denemeObject = try! JSONDecoder().decode(DenemeObject.self, from: datamIlk)
                print("denemeObject:\(denemeObject)")
            } else {
                print("nill")
                
            }
            
            if let data = result?.data {
                print("CF sonrasi donen:\(data)")
                //                let denemeObject = try! JSONDecoder().decode(DenemeObject.self, from: data)
                //                print("denemeObject:\(denemeObject)")

                //                let jsonData = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
//                print("jsonData: \(jsonData)")
//                let denemeObject = try! JSONDecoder().decode(DenemeObject.self, from: jsonData)
            }
        }
    }
    
    func getFriendList() {
        
        // MARK: Firebase callable function always return json format, vise versa return INTERNAL error
        functions.httpsCallable("getFriendList").call { (result, error) in
            // [START function_error]
            print("getFriendList call edildi")
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FIRFunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    print("Remzi hata detay code:\(code) message:\(message) details:\(details)")
                }
                // [START_EXCLUDE]
                print(error.localizedDescription)
                return
                // [END_EXCLUDE]
            }
            // [END function_error]
            if let data = result?.data {
                print("getFriendList CF sonrasi donen:\(data)")
            }
        }
    }
    
}
