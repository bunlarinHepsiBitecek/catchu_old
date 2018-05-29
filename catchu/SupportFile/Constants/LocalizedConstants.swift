//
//  LocalizedConstants.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import Foundation

struct LocalizedConstants {
    static let Ok = NSLocalizedString("OK", comment: "")
    static let UnknownError = NSLocalizedString("UnknownError", comment: "")
    
    struct Login {
        static let Email           = NSLocalizedString("Email", comment: "")
        static let Password        = NSLocalizedString("Password", comment: "")
        static let Login           = NSLocalizedString("Login", comment: "").uppercased(with: NSLocale.current)
        static let ForgotPassword  = NSLocalizedString("ForgotPassword", comment: "")
        static let Register        = NSLocalizedString("Register", comment: "")
        static let DontHaveAccount = NSLocalizedString("DontHaveAccount", comment: "")
        
        static let EmptyEmail      = NSLocalizedString("EmptyEmail", comment: "")
        static let EmptyPassword   = NSLocalizedString("EmptyPassword", comment: "")
        static let InvalidEmail    = NSLocalizedString("InvalidEmail", comment: "")
        static let InvalidPassword = NSLocalizedString("InvalidPassword", comment: "")
    }
    
    struct Register {
        static let UserName        = NSLocalizedString("UserName", comment: "")
        static let Email           = NSLocalizedString("Email", comment: "")
        static let Password        = NSLocalizedString("Password", comment: "")
        static let Register        = NSLocalizedString("Register", comment: "")
        
        static let EmptyUserName   = NSLocalizedString("EmptyUserName", comment: "")
    }
}
