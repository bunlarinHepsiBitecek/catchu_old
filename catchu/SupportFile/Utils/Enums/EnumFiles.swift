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

enum PrivacyType: String {
    case everyone
    case allFollowers
    case custom
    case myself
    
    public var stringValue: String {
        switch self {
        case .everyone:
            return "EVERYONE"
        case .allFollowers:
            return "ALL_FOLLOWERS"
        case .custom:
            return "CUSTOM"
        case .myself:
            return "SELF"
        }
    }
}

enum SchemeType: String {
    case hash
    case mention
}
