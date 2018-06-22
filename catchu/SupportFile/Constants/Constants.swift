//
//  Constants.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

struct Constants {
    static let TWITTER_CUSTOMER_KEY = "qSautcd7v9cuWd3FlH55HLBN6"
    static let TWITTER_CUSTOMER_SECRETKEY = "UQuANLyZKPCW3lRoagkc5VHGrLEYyLbMsXf0UVnkrcEThaJyEl"
    
    struct UIDesignConstant {
        static let PlaceHolderColor: UIColor = UIColor.lightGray
    }
    
    struct CharacterConstants {
        static let SPACE: String = " "
    }
    struct NumericConstants {
        static let INTEGER_ZERO: Int   = 0
        static let DOUBLE_ZERO: Double = 0.0
        static let FLOAT_ZERO: Float   = 0.0
    }
    
    struct MediaLibrary {
        static let ImageHolderSize: CGSize = CGSize(width: 50.0, height: 50.0)
    }
    
    struct Map {
        static let DistanceFilter: Double = 10.0
        static let ZoomDegree: Double       = 0.02
    }
    struct Segue {
        static let RegisterView = "segueToRegisterView"
        static let PasswwordResetView = "segueToPasswordResetView"
    }
    
    struct Storyboard {
        struct ID {
            static let MainTabBarViewController = "MainTabBarViewController"
        }
        
        struct Name {
            static let Main = "Main"
        }
        
    }
    
    struct Cell {
        static let ShareCollectionViewCell        = "ShareCollectionViewCell"
        static let ShareCollectionViewItemPerLine = CGFloat(4)
        static let ShareCollectionViewItemSpace   = CGFloat(3)
    }
    
    struct FirebaseCallableFunctions {
        
        static let createUserProfile = "createUserProfile"
        static let updateUserProfile = "updateUserProfile"
        
    }
    
    struct FirebaseModelConstants {
        
        struct UserModelConstants {
            
            static let userID: String = "userId"
            static let userName: String = "userName"
            static let email: String = "email"
            
        }
        
    }
}
