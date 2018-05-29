//
//  User.swift
//  catchu
//
//  Created by Erkut Baş on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import Firebase

class User {
    
    private var _userName: String
    private var _email: String
    private var _password: String?
    
    init() {
        self._email = Constants.CharacterConstants.SPACE
        self._userName = Constants.CharacterConstants.SPACE
    }
    
    init(userName: String, email: String) {
        self._userName = userName
        self._email = email
    }

    var userName: String {
        get {
            return _userName
        }
        set {
            _userName = newValue
        }
    }
    
    var email: String {
        get {
            return _email
        }
        set {
            _email = newValue
        }
    }
    
    var password: String {
        get {
            if let password = _password {
                return password
            } else {
                return Constants.CharacterConstants.SPACE
            }
        }
        set {
            _password = newValue
        }
    }
    
    func toString() {
        print("userName :\(_userName)")
        print("email :\(_email)")
        print("passworld :\(String(describing: _password))")
        
    }
    
}

class UserShared {
    
    private var _userID: String?
    
    init() {
        self._userID = Constants.CharacterConstants.SPACE
    }
    
    init(userID: String) {
        self._userID = userID
    }
    
    var userID: String {
        get {
            if let userID = _userID {
                return userID
            } else {
                return Constants.CharacterConstants.SPACE
            }
        }
        set {
            _userID = newValue
        }
    }
    
    private static var sharedUserObject: UserShared = {
        
        guard let userID = Auth.auth().currentUser?.uid else { return UserShared() }
        
        let userShared = UserShared(userID: userID)
        
        return userShared
    }()
    
    class func shared() -> UserShared {
        print("shared : \(sharedUserObject.userID)")
        return sharedUserObject
    }
    
    class func sharedUserID() -> String {
        return sharedUserObject.userID
    }
    
}
