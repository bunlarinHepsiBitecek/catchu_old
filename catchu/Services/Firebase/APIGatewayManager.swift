//
//  APIGatewayManager.swift
//  catchu
//
//  Created by Erkut Baş on 8/8/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class APIGatewayManager {
    
    public static var shared = APIGatewayManager()
    
    let client = RECatchUMobileAPIClient.default()
    
    /// The function below manages realtionship between authenticated user and the users registerd in catchu
    ///
    /// - Parameters:
    ///   - inputRequestType:
    ///     makeFollowRequest : to request a follow from a user whose account is private
    ///     acceptFollowRequest : to accept a follow request
    ///     getRequestingFollowList : to get a list of request made by users
    ///     createFollowDirectly : to create a follow with a user whose account is not private
    ///     deleteFollow : to unfollow a user
    ///     deletePendingFollowRequest : to withdraw a follow request
    ///   - reqester: requester userid
    ///   - requested: requested userid
    /// - Author: Erkut
    func requstProces(inputRequestType : RequestType, reqester : String, requested : String, completion :  @escaping (_ httpResult : REFriendRequestList) -> Void) {
        
        let clientInput = REFriendRequest()
        
        clientInput?.requestType = inputRequestType.rawValue
        clientInput?.requesterUserid = reqester
        clientInput?.requestedUserid = requested
        
        client.requestProcessPost(body: clientInput!).continueWith { (task) -> Any? in
            
            if task.error != nil {
                
                print("error : \(String(describing: task.error?.localizedDescription))")
                
                AlertViewManager.shared.createAlert_2(title: LocalizedConstants.Warning, message: LocalizedConstants.DefaultError, preferredStyle: .alert, actionTitle: LocalizedConstants.Location.Ok, actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                
            } else {
                
                if (task.result?.error?.code?.boolValue)! {
                    
                    if let result = task.result {
                        
                        completion(result)
                    }
                    
                }
                
            }
            
            return nil
        }
        
    }
    

    /// To get user profile information from neo4j USER node properties
    ///
    /// - Parameters:
    ///   - userid: authenticated userid
    ///   - completion: REUserProfile
    func getUserProfileInfo(userid : String, completion :  @escaping (_ httpResult : REUserProfile, _ result : Bool) -> Void) {
        
        client.usersGet(userid: userid).continueWith { (task) -> Any? in
        
            if task.error != nil {
                
                print("error : \(String(describing: task.error?.localizedDescription))")
                
                AlertViewManager.shared.createAlert_2(title: LocalizedConstants.Warning, message: LocalizedConstants.DefaultError, preferredStyle: .alert, actionTitle: LocalizedConstants.Location.Ok, actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                
                LoaderController.shared.removeLoader()
                
            } else {
                
                if (task.result?.error?.code?.boolValue)! {
                    
                    if let result = task.result {
                        
                        completion(result, true)
                    }
                    
                }
                
            }
            
            return nil
            
        }
        
    }
    
    
    /// To update user profile information on neo4j USER node properties
    ///
    /// - Parameters:
    ///   - userObject: USER singleton Shared object
    ///   - completion: REError
    func updateUserProfileInformation(requestType : RequestType, userObject : User, completion :  @escaping (_ httpResult : REResponse, _ result : Bool) -> Void) {
     
        print("updateUserProfileInformation starts")
        print("userObject : \(userObject)")
        
        let inputREUserProfile = REUserProfile()
        let inputUserInfo = REUserProfileProperties()
        
        inputUserInfo?.setUserProfileInformation(user: userObject)
        
        inputREUserProfile?.userInfo = inputUserInfo
        inputREUserProfile?.requestType = requestType.rawValue
        
        inputREUserProfile?.userInfo?.displayProperties()
        
        client.usersPost(body: inputREUserProfile!).continueWith { (task) -> Any? in
            
            if task.error != nil {
                
                print("error : \(String(describing: task.error?.localizedDescription))")
                
                AlertViewManager.shared.createAlert_2(title: LocalizedConstants.Warning, message: LocalizedConstants.DefaultError, preferredStyle: .alert, actionTitle: LocalizedConstants.Location.Ok, actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                
                LoaderController.shared.removeLoader()
                
            } else {
                
                print("error : \(String(describing: task.error?.localizedDescription))")
                
                print("task.result : \(task.result)")
                print("task.result.code : \(task.result?.error?.code)")
                print("task.result.message : \(task.result?.error?.message)")
                
                if (task.result?.error?.code?.boolValue)! {
                    
                    if let result = task.result {
                        
                        completion(result, true)
                        
                    }
                }
                
            }
            
            return nil
            
        }
        
    }
    
}
