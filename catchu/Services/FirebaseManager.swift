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
    
    func logout() {
        do
        {
            try Auth.auth().signOut()
            userSignOut()
            print("logout is ok")
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
            print("logout is failed")
        }
    }
    
    // MARK: if user not sigin, redirect loginVC
    func userSignOut() {
        if (Auth.auth().currentUser == nil) {
            User.shared = User()
//            LoaderController.shared.appDelegate().window?.rootViewController = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateInitialViewController()
//            LoaderController.shared.appDelegate().window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: push mainVC
    func userSigned() {
//        if (Auth.auth().currentUser != nil) {
            LoaderController.shared.appDelegate().window?.rootViewController = UIStoryboard(name: Constants.Storyboard.Name.Main, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.Storyboard.ID.MainTabBarViewController)
            LoaderController.shared.appDelegate().window?.rootViewController?.dismiss(animated: true, completion: nil)
//        }
    }
    
    func loginUser(user: User) {
        LoaderController.shared.showLoader()
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (userSignIn, error) in
            if let error = error {
                self.handleError(error: error)
                LoaderController.shared.removeLoader()
                return
            }
            
            if let userSignIn = userSignIn {
                print("user successfully login uid: \(userSignIn.uid)")
                print("REMZI: full:\(userSignIn)")
                User.shared.userID = userSignIn.uid
                User.shared.email = userSignIn.email!
                User.shared.userName = userSignIn.displayName!
                User.shared.providerID = userSignIn.providerID
                User.shared.provider = ProviderType.firebase.rawValue
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
                self.handleError(error: error)
                return
            }
            if (result?.isCancelled)! {
                print("Remzi: User cancel facebook login")
                return
            } else {
                print("***** Token: \(FBSDKAccessToken.current().tokenString)")
                guard let accessToken = FBSDKAccessToken.current().tokenString else {return}
                
                let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, name, short_name, email"], tokenString: FBSDKAccessToken.current().tokenString, version: nil, httpMethod: "GET")
                
                req?.start(completionHandler: { (connection, result, error) in
                    
                    if(error != nil) {
                        print("GET request error: \(String(describing: error))")
                    } else {
                        print("GET request success result: \(String(describing: result))")
                        
                        let data = result as! NSDictionary
                        
                        print("result as a data form: \(data)")
                        
                        self.parseFacebookGraph(data: data, provider: .facebook)
                        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
                        self.firebaseAuth(credential)
                    }
                })
            }
        }
    }
    
    // MARK: Handle event with twitter button
    func loginWithTwitterAccount() {
        let twitterLoginButton = TWTRLogInButton(logInCompletion: { session, error in
            if let error = error {
                self.handleError(error: error)
                return
            }
            
            if let session = session {
                print("REMZİ Twitter dönen session: \(String(describing: session))")
                print("signed in as \(String(describing: session.userName))");
                
                TWTRAPIClient.withCurrentUser().requestEmail { email, error in
                    if (email != nil) {
                        print("get email user: \(String(describing: session.userName)) and email: \(String(describing: email))");
                        let credential = TwitterAuthProvider.credential(withToken: (session.authToken), secret: (session.authTokenSecret))
                        User.shared.userName = session.userName
                        self.firebaseAuth(credential)
                    } else {
                        print("get email error: \(String(describing: error?.localizedDescription))");
                    }
                }
                
            }
        })
        twitterLoginButton.sendActions(for: .touchUpInside)
    }
    
    private func firebaseAuth(_ credential: AuthCredential) {
        LoaderController.shared.showLoader()
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("REMZİ: Unable to authenticate with Firebase")
                print(error)
            } else {
                print("REMZİ: Successfullty authenticate with Firebase")
                if let user = user {
                    print("REMZI1: \(user.providerID)")
                    print("REMZI2: \(user.uid)")
                    print("REMZI3: \(user.email)")
                    print("REMZI4: \(user.displayName)")
                    print("REMZI5: \(user.isEmailVerified)")
                    User.shared.userID = user.uid
                    User.shared.provider = user.providerID
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
    
    func registerFirebase(user: User) {
        
        user.toString()
        
        LoaderController.shared.showLoader()
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (user, error) in
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    if let firebaseErrorCode = Firebase.AuthErrorCode(rawValue: errorCode.code){
                        let functionName = String(#function.split(separator: "(")[0])
                        self.handleFirebaseErrorCodes(errorCode: firebaseErrorCode, functionName)
                    }
                    
                }
                
            } else {
                
                if let user = user {
                    
                    if let userID = user.uid as String? {
                        
                        print("userID : \(userID)")
                        
                        Auth.auth().currentUser?.getIDToken(completion: { (result, error) in
                            
                            if error != nil {
                                
                                if let errorCode = error as NSError? {
                                    
                                    print("errorCode :\(errorCode.localizedDescription)")
                                    
                                }
                                
                            } else {
                                
                                print("result :\(String(describing: result))")
                                CloudFunctionsManager.shared.createUserProfileModel(userID: userID)
                                
                            }
                            
                        })
                        
                    }
                    
                }
                
            }
            
            LoaderController.shared.removeLoader()
        }
    }
    
    func handleError(error: Error) {
        print("error: \(String(describing: error.localizedDescription))");
        if let errorCode = error as NSError? {
            if let firebaseErrorCode = Firebase.AuthErrorCode(rawValue: errorCode.code){
                let functionName = String(#function.split(separator: "(")[0])
                self.handleFirebaseErrorCodes(errorCode: firebaseErrorCode, functionName)
            }
        }
    }
    
    func handleFirebaseErrorCodes(errorCode: AuthErrorCode,_ callerFunctionName: String) {
        
        switch errorCode {
        case .accountExistsWithDifferentCredential:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.accountExistsWithDifferentCredential, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            
        case .credentialAlreadyInUse:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.credentialAlreadyInUse, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            
        case .emailAlreadyInUse:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.emailAlreadyInUse, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            
        case .invalidCredential:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.invalidCredential, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            
        case .invalidEmail:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.invalidEmail, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            
        case .userNotFound:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.userNotFound, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
            
        default:
            AlertViewManager.shared.createAlert(title: LocalizedConstants.Error, message: LocalizedConstants.FirebaseError.unknownError, preferredStyle: .alert, actionTitle: LocalizedConstants.Ok, actionStyle: .default, completionHandler: nil)
//            let className = type(of: self)
            let className = ""
            let eventName = className + "_" + callerFunctionName
            Analytics.logEvent(eventName, parameters: [
                "email": User.shared.email,
                "password": User.shared.password])
        }
        
    }
    
}


struct FacebookPermissions {
    static let email = "email"
    static let public_profile = "public_profile"
    static let user_friends = "user_friends"
}

public enum ProviderType: String  {
    case facebook, twitter, firebase
}

struct DenemeObject: Decodable {
    let name: String?
    let surname: String?
    let age: Int?
}
