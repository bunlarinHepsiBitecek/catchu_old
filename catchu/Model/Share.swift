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
    
    private var _image : UIImage
    private var _textScreenShot : UIImage
    private var _videoScreenShot : UIImage
    private var _location : CLLocation
    private var _shareId : String
    
    private var _imageUrl : URL
    private var _textScreenShotUrl : URL
    private var _videoScreenShotUrl : URL
    
    private var _sharedDataDictionary : Dictionary<String, String> = [:]

    init() {
        
        _image = UIImage()
        _textScreenShot = UIImage()
        _videoScreenShot = UIImage()
        _location = CLLocation()
        _shareId = Constants.CharacterConstants.SPACE
        _imageUrl = URL(string: Constants.CharacterConstants.SPACE)!
        _textScreenShotUrl = URL(string: Constants.CharacterConstants.SPACE)!
        _videoScreenShotUrl = URL(string: Constants.CharacterConstants.SPACE)!
    }
    
    var image : UIImage {
        get {
            return _image
        }
        set {
            _image = newValue
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
    
    func appendElementIntoDictionary(key : String, value : String) {
        
        self._sharedDataDictionary[key] = value
        
    }
    
    func createSharedDataDictionary() -> Dictionary<String, String> {
        
        if !_shareId.isEmpty {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.sharedId, value: _shareId)
            
        }
        
        if _imageUrl.isFileURL {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.imageUrl, value: _imageUrl.absoluteString)
            
        }
        
        if _textScreenShotUrl.isFileURL {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.textScreenShotUrl, value: _textScreenShotUrl.absoluteString)
            
        }
        
        if _videoScreenShotUrl.isFileURL {
            
            appendElementIntoDictionary(key: Constants.FirebaseModelConstants.ShareModelConstants.videoScreenShotUrl, value: _videoScreenShotUrl.absoluteString)
            
        }
        
        return _sharedDataDictionary
        
    }
    
    
}
