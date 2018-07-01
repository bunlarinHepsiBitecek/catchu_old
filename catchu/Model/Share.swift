//
//  Share.swift
//  catchu
//
//  Created by Erkut Baş on 6/25/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import MapKit

class Share {
    
    public static var shared = Share()
    
    private var _tempImageView = UIImageView()
    
    private var _image : UIImage
    private var _imageSmall : UIImage
    private var _text: String
    private var _textScreenShot : UIImage
    private var _videoScreenShot : UIImage
    private var _location : CLLocation
    private var _shareId : String
    
    private var _imageUrl : String
    private var _imageUrlSmall : String
    private var _textScreenShotUrl : String
    private var _videoScreenShotUrl : String
    
    private var _sharedDataDictionary : Dictionary<String, String> = [:]
    private var _shareQueryResultDictionary : Dictionary<String, Share> = [:]

    init() {
        
        _image = UIImage()
        _imageSmall = UIImage()
        _text = Constants.CharacterConstants.SPACE
        _textScreenShot = UIImage()
        _videoScreenShot = UIImage()
        _location = CLLocation()
        _shareId = Constants.CharacterConstants.SPACE
        _imageUrl = Constants.CharacterConstants.SPACE
        _imageUrlSmall = Constants.CharacterConstants.SPACE
        _textScreenShotUrl = Constants.CharacterConstants.SPACE
        _videoScreenShotUrl = Constants.CharacterConstants.SPACE
        
//        _imageUrl = URL(string: Constants.CharacterConstants.SPACE)!
//        _textScreenShotUrl = URL(string: Constants.CharacterConstants.SPACE)!
//        _videoScreenShotUrl = URL(string: Constants.CharacterConstants.SPACE)!
    }
    
    var image : UIImage {
        get {
            return _image
        }
        set {
            _image = newValue
        }
    }
    var imageSmall : UIImage {
        get {
            return self._imageSmall
        }
        set {
            self._imageSmall = newValue
        }
    }
    
    var text: String {
        get {
            return self._text
        }
        set {
            self._text = newValue
        }
    }
    
    var textScreenShot : UIImage {
        get {
            return _textScreenShot
        }
        set {
            _textScreenShot = newValue
        }
    }
    
    var videoScreenShot : UIImage {
        get {
            return _videoScreenShot
        }
        set {
            _videoScreenShot = newValue
        }
    }
    
    var location: CLLocation {
        get {
            return _location
        }
        set {
            _location = newValue
        }
    }
    
    var shareId: String {
        get {
            return _shareId
        }
        set {
            _shareId = newValue
        }
    }
    
    var imageUrl: String {
        get {
            return self._imageUrl
        }
        set {
            self._imageUrl = newValue
        }
    }
    
    var imageUrlSmall: String {
        get {
            return _imageUrlSmall
        }
        set {
            _imageUrlSmall = newValue
        }
    }

    
    var tempImageView: UIImageView {
        get {
            return _tempImageView
        }
        set {
            _tempImageView = newValue
        }
    }
    
    var shareQueryResultDictionary: Dictionary<String, Share> {
        get {
            return _shareQueryResultDictionary
        }
        set {
            _shareQueryResultDictionary = newValue
        }
    }
    
    func appendElementIntoShareQueryResultDictionary(key : String, value : Share) {
        
        self._shareQueryResultDictionary[key] = value
        
    }
    
    func appendElementIntoDictionary(key : String, value : String) {
        
        self._sharedDataDictionary[key] = value
        
    }
    
    func parseShareData(dataDictionary : [String : AnyObject]) {
        
        self._imageUrl = dataDictionary["imageUrl"] as? String ?? Constants.CharacterConstants.SPACE
        self._imageUrlSmall = dataDictionary["imageUrlSmall"] as? String ?? Constants.CharacterConstants.SPACE
        self._text = dataDictionary["text"] as? String ?? Constants.CharacterConstants.SPACE
        
    }
    
    func createSharedDataDictionary() -> Dictionary<String, String> {
        
        if !self._shareId.isEmpty {
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.shareId, value: _shareId)
        }
        
        if !self._imageUrl.isEmpty {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.imageUrl, value: self._imageUrl)
            
        }
        
        if !self._imageUrlSmall.isEmpty {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.imageUrlSmall, value: self._imageUrlSmall)
            
        }
        
        if !self._textScreenShotUrl.isEmpty {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.textScreenShotUrl, value: self._textScreenShotUrl)
            
        }
        
        if !self._videoScreenShotUrl.isEmpty {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.videoScreenShotUrl, value: self._videoScreenShotUrl)
            
        }
        
        if !self._text.isEmpty {
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.Text, value: self._text)
        }
        
        return _sharedDataDictionary
        
    }
    
    
}
