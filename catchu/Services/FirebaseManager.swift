//
//  FirebaseManager.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/27/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit

class FirebaseManager {
    
    public static let shared = FirebaseManager()
    
    func loginUser(user: User) {
        LoaderController.shared.showLoader()
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (userSignIn, error) in
            if error != nil {
                print("signIn Error: \(String(describing: error?.localizedDescription))")
                
                if let errorCode = Firebase.AuthErrorCode(rawValue: (error?._code)!) {
                    switch errorCode {
                    case .operationNotAllowed:
                        print("operationNotAllowed")
                        Analytics.logEvent("\(type(of: self))_\("signIn")", parameters: [
                            "email": user.email,
                            "password": user.password])
                    case .invalidEmail:
                        print("invalidEmail")
                        Analytics.logEvent("\(type(of: self))_\("signIn")", parameters: [
                            "email": user.email,
                            "password": user.password])
                    case .userDisabled:
                        print("userDisabled")
                        Analytics.logEvent("\(type(of: self))_\("signIn")", parameters: [
                            "email": user.email,
                            "password": user.password])
                    case .wrongPassword:
                        print("wrongPassword")
                        Analytics.logEvent("\(type(of: self))_\("signIn")", parameters: [
                            "email": user.email,
                            "password": user.password])
                    case .userNotFound:
                        print("userNotFound")
                        Analytics.logEvent("\(type(of: self))_\("signIn")", parameters: [
                            "email": user.email,
                            "password": user.password])
                    default:
                        print("default")
                    }

                }
            } else {
                if let userSignIn = userSignIn {
                    print("user successfully login uid: \(userSignIn.uid)")
                    print("REMZI: full:\(userSignIn)")
                    User.shared.userID = userSignIn.uid
                    User.shared.email = userSignIn.email!
                    User.shared.userName = userSignIn.displayName!
                    User.shared.provider = ProviderType.firebase.rawValue
                }
            }
            
            LoaderController.shared.removeLoader()
        }
    }
    
    func loginWithFacebookAccount() {
        let currentVC = getPresentViewController()
        
        let facebookLogin = FBSDKLoginManager()
        let permissions = [FacebookPermissions.email,
                           FacebookPermissions.public_profile,
                           FacebookPermissions.user_friends]
        
        facebookLogin.logIn(withReadPermissions: permissions, from: currentVC) { (result, error) in
            if let error = error {
                print("There is an error: \(error)")
                return
            }
            if (result?.isCancelled)! {
                print("Remzi: User cancel facebook login")
                return
            } else {
                print("***** Token: \(FBSDKAccessToken.current().tokenString)")
                guard let accessToken = FBSDKAccessToken.current().tokenString else {return}
                
                let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, name, first_name, last_name, email"], tokenString: FBSDKAccessToken.current().tokenString, version: nil, httpMethod: "GET")
                
                req?.start(completionHandler: { (connection, result, error) in
                    
                    if(error != nil) {
                        print("GET request error: \(String(describing: error))")
                    } else {
                        print("GET request success result: \(String(describing: result))")
                        
                        let data = result as! NSDictionary
                        
                        print("result as a data form: \(data)")
                        
                        self.parseFacebookGraph(data: data, provider: .facebook)
                    }
                })
                
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
                self.firebaseAuth(credential, User.shared.name, .facebook)
            }
        }
    }
    
    // MARK: Handle event with twitter button
    func loginWithTwitterAccount() {
        let twitterLoginButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("REMZİ Twitter dönen session: \(String(describing: session))")
                print("signed in as \(String(describing: session?.userName))");
                
                TWTRAPIClient.withCurrentUser().requestEmail { email, error in
                    if (email != nil) {
                        print("get email user: \(String(describing: session?.userName)) and email: \(String(describing: email))");
                        let credential = TwitterAuthProvider.credential(withToken: (session?.authToken)!, secret: (session?.authTokenSecret)!)
                        let userName = (session?.userName)!
                        self.firebaseAuth(credential, userName, .twitter)
                    } else {
                        print("get email error: \(String(describing: error?.localizedDescription))");
                    }
                }
                
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
        twitterLoginButton.sendActions(for: .touchUpInside)
    }
    
    private func firebaseAuth(_ credential: AuthCredential, _ userName: String, _ provider: ProviderType) {
        LoaderController.shared.showLoader()
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("REMZİ: Unable to authenticate with Firebase")
                print(error)
            } else {
                print("REMZİ: Successfullty authenticate with Firebase")
                if let user = user {
                    print("REMZI: Userid:\(user.uid) userEmail: \(user.email) name:\(user.displayName)")
                    print("REMZI: full:\(user)")
                    User.shared.userID = user.uid
                    User.shared.email = user.email!
                    User.shared.userName = user.displayName!
                    User.shared.provider = provider.rawValue
                }
            }
        }
        LoaderController.shared.removeLoader()
    }
    
    func parseFacebookGraph(data: NSDictionary, provider: ProviderType) {
        User.shared.provider = provider.rawValue
        
        if let email = data["email"]  as? String {
            User.shared.email = email
        }
        if let name = data["name"]  as? String {
            User.shared.name = name
        }
        if let providerID = data["id"]  as? String {
            User.shared.providerID = providerID
        }
    }
    
    // MARK: find current VC
    private func getPresentViewController() -> UIViewController {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return UIViewController()
    }
}


struct FacebookPermissions {
    static let email = "email"
    static let public_profile = "public_profile"
    static let user_friends = "user_friends"
}

public enum ProviderType: String  {
    case facebook, twitter, firebase
    
//    public var stringValue: String {
//        switch self {
//        case .facebook:
//            return "facebook"
//        case .twitter:
//            return "twitter"
//        case .firebase:
//            return "firebase"
//        }
//    }
    
}
