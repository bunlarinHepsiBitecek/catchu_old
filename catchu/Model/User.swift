//
//  User.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class User {
    public static let shared = User()
    
    private var _userID: String
    private var _userName: String
    private var _name: String
    private var _email: String
    private var _password: String
    private var _provider: String
    private var _providerID: String
    
    private var _userDataDictionary : Dictionary<String, String> = [:]
    
    init() {
        self._userID     = Constants.CharacterConstants.SPACE
        self._email      = Constants.CharacterConstants.SPACE
        self._userName   = Constants.CharacterConstants.SPACE
        self._name       = Constants.CharacterConstants.SPACE
        self._password   = Constants.CharacterConstants.SPACE
        self._provider   = Constants.CharacterConstants.SPACE
        self._providerID = Constants.CharacterConstants.SPACE
    }
    
    init(userID: String, userName: String, name: String, email: String, password: String, provider: String, providerID: String) {
        self._userID     = userID
        self._userName   = userName
        self._name       = name
        self._email      = email
        self._password   = password
        self._provider   = provider
        self._providerID = providerID
    }
    
    var userID: String {
        get {
            return self._userID
        }
        set {
            self._userID = newValue
        }
    }
    
    var userName: String {
        get {
            return self._userName
        }
        set {
            self._userName = newValue
        }
    }
    
    var name: String {
        get {
            return self._name
        }
        set {
            self._name = newValue
        }
    }
    
    var email: String {
        get {
            return self._email
        }
        set {
            self._email = newValue
        }
    }
    
    var password: String {
        get {
            return self._password
        }
        set {
            self._password = newValue
        }
    }
    
    var provider: String {
        get {
            return self._provider
        }
        set {
            self._provider = newValue
        }
    }
    
    var providerID: String {
        get {
            return self._providerID
        }
        set {
            self._providerID = newValue
        }
    }
    
    func toString() {
        print("userName :\(_userName)")
        print("email :\(_email)")
        print("passworld :\(String(describing: _password))")
    }
    
    func appendElementIntoDictionary(key : String, value : String) {
        
        self._userDataDictionary[key] = value
        
    }
    
    func createUserDataDictionary() -> Dictionary<String, String> {
        
        if !_userID.isEmpty {
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.UserModelConstants.userID, value: _userID)
        }
        
        if !_userName.isEmpty {
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.UserModelConstants.userName, value: _userName)
        }
        
        if !_email.isEmpty {
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.UserModelConstants.email, value: _email)
        }
        
        return _userDataDictionary
    }
    
}
