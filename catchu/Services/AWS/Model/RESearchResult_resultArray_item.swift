/*
 Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */
 

import Foundation
import AWSCore

@objcMembers
public class RESearchResult_resultArray_item : AWSModel {
    
    var name: String?
    var userid: String?
    var username: String?
    var profilePhotoUrl: String?
    var friendRelation: NSNumber?
    var pendingFriendRequest: NSNumber?
    var isPrivateAccount: NSNumber?
    
   	public override static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]!{
		var params:[AnyHashable : Any] = [:]
		params["name"] = "name"
		params["userid"] = "userid"
		params["username"] = "username"
		params["profilePhotoUrl"] = "profilePhotoUrl"
		params["friendRelation"] = "friendRelation"
        params["pendingFriendRequest"] = "pendingFriendRequest"
        params["isPrivateAccount"] = "isPrivateAccount"
		
        return params
	}
    
    func displayProperties() {
        
        print("name : \(self.name)")
        print("userid :\(self.userid)")
        print("username : \(self.username)")
        print("profilePhotoUrl :\(self.profilePhotoUrl)")
        print("friendRelation :\(self.friendRelation)")
    }
    
    var _name: String {
        get {
            return name!
        }
        set {
            name = newValue
        }
    }
    
    var _userid: String {
        get {
            return userid!
        }
        set {
            userid = newValue
        }
    }
    
    var _username: String {
        get {
            return username!
        }
        set {
            username = newValue
        }
    }
    
    var _profilePhotoUrl: String {
        get {
            
            if let photoUrl = profilePhotoUrl {
                return photoUrl
            } else {
                return Constants.CharacterConstants.SPACE
            }
            
            //return profilePhotoUrl!
        }
        set {
            profilePhotoUrl = newValue
        }
    }
    
    var _friendRelation: NSNumber {
        get {
            return friendRelation!
        }
        set {
            friendRelation = newValue
        }
    }
    
    var _pendingFriendRequest: NSNumber {
        get {
            return pendingFriendRequest!
        }
        set {
            pendingFriendRequest = newValue
        }
    }
    
    var _isPrivateAccount: NSNumber {
        get {
            return isPrivateAccount!
        }
        set {
            isPrivateAccount = newValue
        }
    }
    
}
