//
//  EnumFiles.swift
//  catchu
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

enum IconManagement {
    case open
    case close
    case selected
    case deselected
}

enum SegmentedButtonChoise {
    case friends
    case groups
    case groupCreation
    case nothing
}

enum EnumContainerView {
    
    case containerViewFriend
    case containerViewGroup
    
}

enum RequestType : String {
    
    case followRequest = "followRequest"
    case acceptFollowRequest = "acceptRequest"
    case getRequestingFollowList = "requestingFollowList"
    case createFollowDirectly = "createFollowDirectly"
    case deleteFollow = "deleteFollow"
    case deletePendingFollowRequest = "deletePendingFollowRequest"
    case defaultRequest = "Nothing"
    case user_profile_update = "USER_PROFILE_UPDATE"
 
}

enum CallerViewController {
    
    case EditProfile4View
    case Profile4ViewController
}

enum ButtonChoosen {
    case selected
    case deselected
}

enum PermissionFLows {
    case camera
    case photoLibrary
    case cameraUnathorized
    case photoLibraryUnAuthorized
}

