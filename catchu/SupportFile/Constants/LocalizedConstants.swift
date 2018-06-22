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
    static let Error = NSLocalizedString("Error", comment: "")
    
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
    
    struct PasswordReset {
        static let PasswordResetMailSend = NSLocalizedString("PasswordResetMailSend", comment: "")        
    }
    
    struct Register {
        static let UserName        = NSLocalizedString("UserName", comment: "")
        static let Email           = NSLocalizedString("Email", comment: "")
        static let Password        = NSLocalizedString("Password", comment: "")
        static let Register        = NSLocalizedString("Register", comment: "")
        
        static let EmptyUserName   = NSLocalizedString("EmptyUserName", comment: "")
    }
    
    struct FirebaseError {
        
        static let accountExistsWithDifferentCredential =   
            NSLocalizedString("accountExistsWithDifferentCredential", comment: "")
        static let credentialAlreadyInUse =
            NSLocalizedString("credentialAlreadyInUse", comment: "")
        static let emailAlreadyInUse =
            NSLocalizedString("emailAlreadyInUse", comment: "")
        static let invalidCredential =
            NSLocalizedString("invalidCredential", comment: "")
        static let invalidEmail =
            NSLocalizedString("invalidEmail", comment: "")
        static let userNotFound =
            NSLocalizedString("userNotFound", comment: "")
        static let unknownError = NSLocalizedString("unknownError", comment: "")
    
    }
    
    struct TitleValues {
        
        struct ButtonTitle {
            
            static let cancel = NSLocalizedString("cancel", comment: "")
            static let next = NSLocalizedString("next", comment: "")
            static let friend = NSLocalizedString("Friends", comment: "")
            static let group = NSLocalizedString("Groups", comment: "")
            static let newGroup = NSLocalizedString("New Group", comment: "")
            
        }
        
        struct LabelTitle {

            static let addParticipant = NSLocalizedString("addParticipant", comment: "")
            
        }
    }
    struct Location {
        static let LocationServiceDisableTitle = NSLocalizedString("LocationServiceDisableTitle", comment: "")
        static let LocationServiceDisable      = NSLocalizedString("LocationServiceDisable", comment: "")
        static let Settings                    = NSLocalizedString("Settings", comment: "")
        static let Ok                          = NSLocalizedString("OK", comment: "")
    }
    
    struct SearchBar {
        static let searchResult = NSLocalizedString("Search Result", comment: "")
    }
    struct Library {
        static let AccessLibraryDisableTitle   = NSLocalizedString("AccessLibraryDisableTitle", comment: "")
        static let AccessLibraryDisable        = NSLocalizedString("AccessLibraryDisable", comment: "")
        static let Settings                    = NSLocalizedString("Settings", comment: "")
        static let Ok                          = NSLocalizedString("OK", comment: "")
    }
}
