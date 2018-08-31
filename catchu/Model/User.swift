//
//  User.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import FirebaseFunctions

class User {
    public static var shared = User()
    
    private var _userID: String
    private var _userName: String
    private var _name: String
    private var _email: String
    private var _password: String
    private var _provider: String
    private var _providerID: String
    private var _profilePictureUrl: String?
    
    // the attributes below is used for collectionView management
    private var _indexPathCollectionview : IndexPath!
    private var _indexPathTableView : IndexPath!
    private var _indexPathTableViewOfSearchMode : IndexPath!
    private var _isUserSelected : Bool
    
    private var _userDataDictionary : Dictionary<String, String> = [:]
    
    private var _userFriendList : Dictionary<String, User> = [:]
    private var _sortedFriendArray : Array<User> = []
    // authenticated user's follow requests made by other users
    private var _requestingFriendList : Array<User> = []
    
    private var _isUserHasAFriendRelation : Bool!
    private var _isUserHasPendingFriendRequest: Bool!
    private var _isUserHasAPrivateAccount : Bool!
    
    init() {
        self._userID     = Constants.CharacterConstants.SPACE
        self._email      = Constants.CharacterConstants.SPACE
        self._userName   = Constants.CharacterConstants.SPACE
        self._name       = Constants.CharacterConstants.SPACE
        self._password   = Constants.CharacterConstants.SPACE
        self._provider   = Constants.CharacterConstants.SPACE
        self._providerID = Constants.CharacterConstants.SPACE
        self._isUserSelected = false
        self._indexPathCollectionview = IndexPath()
        self._indexPathTableViewOfSearchMode = IndexPath()
        self._indexPathTableView = IndexPath()
        self._isUserHasAFriendRelation = false
        self._isUserHasPendingFriendRequest = false
    }
    
    init(userID: String, userName: String, name: String, email: String, password: String, provider: String, providerID: String) {
        self._userID     = userID
        self._userName   = userName
        self._name       = name
        self._email      = email
        self._password   = password
        self._provider   = provider
        self._providerID = providerID
        self._isUserSelected = false
    }
    
    func parseFriendDataToUser(dataDictionary : [String : AnyObject]) {
        
        self._name = dataDictionary["nameSurname"] as? String ?? ""
        self._profilePictureUrl = dataDictionary["profilePictureUrl"] as? String ?? ""
        self._providerID = dataDictionary["providerId"] as? String ?? ""
        
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
    
    var userFriendList: Dictionary<String, User> {
        get {
            return _userFriendList
        }
        set {
            _userFriendList = newValue
        }
    }
    
    var sortedFriendArray: Array<User> {
        get {
            return _sortedFriendArray
        }
        set {
            _sortedFriendArray = newValue
        }
    }
    
    var profilePictureUrl: String {
        get {
            return _profilePictureUrl!
        }
        set {
            _profilePictureUrl = newValue
        }
    }
    
    var indexPathCollectionView: IndexPath {
        get {
            return _indexPathCollectionview
        }
        set {
            _indexPathCollectionview = newValue
        }
    }
    
    var indexPathTableView: IndexPath {
        get {
            return _indexPathTableView
        }
        set {
            _indexPathTableView = newValue
        }
    }
    
    var isUserSelected: Bool {
        get {
            return _isUserSelected
        }
        set {
            _isUserSelected = newValue
        }
    }
    
    var indexPathTableViewOfSearchMode: IndexPath {
        get {
            return _indexPathTableViewOfSearchMode
        }
        set {
            _indexPathTableViewOfSearchMode = newValue
        }
    }
    
    var isUserHasAFriendRelation: Bool {
        get {
            return _isUserHasAFriendRelation
        }
        set {
            _isUserHasAFriendRelation = newValue
        }
    }
    
    var isUserHasPendingFriendRequest: Bool {
        get {
            return _isUserHasPendingFriendRequest
        }
        set {
            _isUserHasPendingFriendRequest = newValue
        }
    }
    
    var requestingFriendList: Array<User> {
        get {
            return _requestingFriendList
        }
        set {
            _requestingFriendList = newValue
        }
    }
    
    var isUserHasAPrivateAccount: Bool {
        get {
            return _isUserHasAPrivateAccount
        }
        set {
            _isUserHasAPrivateAccount = newValue
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
    
    func appendElementIntoFriendList(httpResult : HTTPSCallableResult) {
        
        let dataDictionary = httpResult.data as! Dictionary<String, Any>
        
        print("dataDictionary : \(dataDictionary)")
        
        for item in dataDictionary {
            
            let userData = item.value as! [String : AnyObject]
            
            let tempUser = User()
            
            tempUser.parseFriendDataToUser(dataDictionary: userData)
            tempUser.userID = item.key
            
            User.shared._userFriendList[item.key] = tempUser
            
        }
        
        for item in User.shared.userFriendList {
            
            print("key ---> :\(item.key)")
            print("val ---> :\(item.value)")
        }
    }
    
    func appendElementIntoFriendListAWS(httpResult : REFriendList) {
        
        for item in httpResult.resultArray! {
            
            let tempUser = User()
            
            tempUser.userID = item.userid!
            tempUser.userName = item.username!
            tempUser.profilePictureUrl = item.profilePhotoUrl!
            tempUser.name = item.name!
            
            User.shared._userFriendList[item.userid!] = tempUser
            
        }
        
        
//        for item in dataDictionary {
//
//            let userData = item.value as! [String : AnyObject]
//
//            let tempUser = User()
//
//            tempUser.parseFriendDataToUser(dataDictionary: userData)
//            tempUser.userID = item.key
//
//            User.shared._userFriendList[item.key] = tempUser
//
//        }
//
//        for item in User.shared.userFriendList {
//
//            print("key ---> :\(item.key)")
//            print("val ---> :\(item.value)")
//        }
    }
    
    func createSortedUserArray() {
        
        var tempArray : Array<User> = []
        
        for item in User.shared.userFriendList {
            
            tempArray.append(item.value)
            
        }
        
        _sortedFriendArray = tempArray.sorted(by: {$0._name < $1._name})
        
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
    
    func addRequestingFollow(httpResult : REFriendRequestList) {
        
        for item in httpResult.resultArray! {
            
            let tempUser = User()
            
            tempUser.userID = item.userid!
            tempUser.userName = item.username!
            tempUser.profilePictureUrl = item.profilePhotoUrl!
            tempUser.name = item.name!
            
            _requestingFriendList.append(tempUser)
            
        }
        
    }
    
    
}
