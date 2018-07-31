//
//  Search.swift
//  catchu
//
//  Created by Erkut Baş on 7/31/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class Search {
    
    public static var shared = Search()
    
    private var _isSearchProgressActive :Bool!
    private var _searchKey :String!
    private var _searchResultArray :Array<User>!
    
    init() {
        
        _isSearchProgressActive = false
        _searchKey = Constants.CharacterConstants.SPACE
        _searchResultArray = Array<User>()
        
    }
    
    var isSearchProgressActive: Bool {
        get {
            return _isSearchProgressActive
        }
        set {
            _isSearchProgressActive = newValue
        }
    }
    
    var searchKey: String {
        get {
            return _searchKey
        }
        set {
            _searchKey = newValue
        }
    }
    
    var searchResultArray: Array<User> {
        get {
            return _searchResultArray
        }
        set {
            _searchResultArray = newValue
        }
    }
    
    
}
