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
        static let INTEGER_ONE : Int = 1
        static let INTEGER_TWO : Int = 2
        static let DOUBLE_ZERO: Double = 0.0
        static let FLOAT_ZERO: Float   = 0.0
        
        struct GeoFireUnits {
            
            static let GEOFIRE_QUERY_RADIUS : Double = 0.05
            
        }
        
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
        static let SegueToFriend = "segueToFriend"
        static let SegueToGroup = "segueToGroup"
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
        static let getFriends = "getFriends"
        static let setNewShareData = "setNewShareData"
        static let getShareDataByUserNameAndShareID = "getShareDataByUserNameAndShareID"
        static let getShareDataByShareID = "getShareDataByShareID"
    }
    
    struct FirebaseModelConstants {
        
        struct UserModelConstants {
            
            static let userID: String = "userId"
            static let userName: String = "userName"
            static let email: String = "email"
            
        }
        
        struct ShareModelConstants {
            
            static let sharedId: String = "sharedId"
            static let imageUrl : String = "imageUrl"
            static let textScreenShotUrl : String = "textScreenShotUrl"
            static let videoScreenShotUrl : String = "videoScreenShotUrl"
            
        }
        
        struct PathNames {
            
            static let Media = "Media"
            static let Share = "Share"
            static let TextScreenShots = "TextScreenShots"
            static let Images = "Images"
            
        }
        
        struct ModelNames {
            
            static let GeoFire = "GeoFire"
            static let GeoFireModel = "GeoFireModel"
            static let ShareData = "ShareData"
        }
        
    }
    
    struct StoryBoardID {
        
        static let Contact: String = "Contact"
        static let Main: String = "Main"
        static let Login: String = "Login"
        
    }
    
    struct ViewControllerIdentifiers {
        
        static let ContactViewController: String = "ContactViewController"
        
    }
    
    struct Collections {
        
        struct CollectionView {
            
            static let collectionViewCellFriend: String = "collectionViewCellFriend"
            
        }
        
        struct TableView {
            
            static let tableViewCellFriend: String = "tableViewCellFriend"
            
        }
        
    }
    
    struct NumericValues {
        
        static let rowHeight : CGFloat = 60.0
        
    }
    
    struct NotificationCenterConstants {
        
        static let refreshCounterValues : String = "refreshCounterValues"
        
    }
    
    struct searchBarProperties {
        
        static let searchField : String = "searchField"
        
    }
    
    struct NotificationConstants {
        
        static let requestIdentifier : String = "LocalNotificationRequest"
        
    }
    
    struct NumberOrSections {
        
        static let section0 = 0
        static let section1 = 1
        static let section2 = 2
        static let section3 = 3
        static let section4 = 4
        static let section5 = 5
        static let section6 = 6
        static let section7 = 7
        static let section8 = 8
        static let section9 = 9
        static let section10 = 10
        static let section11 = 11
        static let section12 = 12
        static let section13 = 13
        static let section14 = 14
        static let section15 = 15
        static let section16 = 16
        static let section17 = 17
        static let section18 = 18
        static let section19 = 19
        static let section20 = 20
        static let section21 = 21
        static let section22 = 22
        static let section23 = 23
        static let section24 = 24
        static let section25 = 25
        static let section26 = 26
        static let section27 = 27
        static let section28 = 28
        static let section29 = 29
        static let section30 = 30
        
    }

    struct LetterConstants {
        
        static let A = "A"
        static let B = "B"
        static let C = "C"
        static let D = "D"
        static let E = "E"
        static let F = "F"
        static let G = "G"
        static let H = "H"
        static let I = "I"
        static let J = "J"
        static let K = "K"
        static let L = "L"
        static let M = "M"
        static let N = "N"
        static let O = "O"
        static let P = "P"
        static let Q = "Q"
        static let R = "R"
        static let S = "S"
        static let T = "T"
        static let U = "U"
        static let V = "V"
        static let W = "W"
        static let X = "X"
        static let Y = "Y"
        static let Z = "Z"
        
    }
    
}
