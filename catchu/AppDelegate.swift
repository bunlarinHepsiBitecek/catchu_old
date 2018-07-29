//
//  AppDelegate.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/26/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import Firebase
//import IQKeyboardManagerSwift
import FBSDKLoginKit
import TwitterKit
import UserNotifications

import AWSCognitoIdentityProvider

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    // to manage cognito user interfaces
    var navigationController: UINavigationController?
    var navigationTabBarController : UITabBarController?
    var loginViewController: LoginViewController?
    
    var storyboardMain: UIStoryboard? {
        return UIStoryboard(name: Constants.Storyboard.Name.Main, bundle: nil)
    }
    
    var storyboardLogin: UIStoryboard? {
        return UIStoryboard(name: Constants.Storyboard.Name.Login, bundle: nil)
    }

    // to configure cognito settings
    var cognitoConfig : CognitoConfig?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()

        
        //Facebook
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //Twitter
        TWTRTwitter.sharedInstance().start(withConsumerKey: Constants.TWITTER_CUSTOMER_KEY, consumerSecret: Constants.TWITTER_CUSTOMER_SECRETKEY)
        
        
        //NotificationManager.shared.initializeRegisterForRemoteNotification()
        //application.registerForRemoteNotifications()
        //UIApplication.shared.registerForRemoteNotifications()
        
        if #available(iOS 10.0, *) {
            let center  = UNUserNotificationCenter.current()
            center.delegate = self as UNUserNotificationCenterDelegate
            center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
                if error == nil{
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            }
        }
        else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        // AWS kullanacagimizdan dolayi firebase akisini simdilik kapatalim
        //FirebaseManager.shared.checkUserLoggedIn()
        
        // setup logging
        // asagidaki 2 satir fonksiyonun ne ise yaradigini sonradan ogrenelim
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        // setup cognito config
        self.cognitoConfig = CognitoConfig()
        
        // setup cognito
        setupCognitoUserPool()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: Twitter log-in - Completed sign-in but not being redirected to my app
    func application(_ application:UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
//        let directedByGGL =  GIDSignIn.sharedInstance().handle(url as URL!, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        let directedByTWTR =  TWTRTwitter.sharedInstance().application(application, open: url, options: options)
        return directedByTWTR
    }
    
    func initiateNotificationSettings() {
        
        UIApplication.shared.registerForRemoteNotifications()
        
        let center = UNUserNotificationCenter.current()
        
        center.delegate = self
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        completionHandler()
        
    }
    
}

// to use interactive user interface for user sign in process with username and password
extension AppDelegate : AWSCognitoIdentityInteractiveAuthenticationDelegate {
    
//    func startPasswordAuthentication() -> AWSCognitoIdentityPasswordAuthentication {
//
////        LoaderController.shared.goToLoginViewController()
////
////        print("self.window?.rootViewController : \(self.window?.rootViewController)")
//
////        if(self.navigationController == nil) {
////            self.navigationController = self.window?.rootViewController as? UINavigationController
////        }
//
//        if(self.navigationTabBarController == nil) {
//            self.navigationTabBarController = self.window?.rootViewController as? UITabBarController
//        }
//
////        if(self.loginViewController == nil) {
////            self.loginViewController = (self.storyboardLogin?.instantiateViewController(withIdentifier: Constants.Storyboard.ID.LoginViewController) as? LoginViewController)!
////        }
//
////        if(self.login == nil) {
////            self.zalama = (self.storyboardLogin?.instantiateViewController(withIdentifier: "zalamaViewController") as? zalamaViewController)!
////        }
//
//        if(self.loginViewController == nil) {
//            self.loginViewController = (self.storyboardLogin?.instantiateViewController(withIdentifier: Constants.Storyboard.ID.LoginViewController) as? LoginViewController)!
//        }
//
//        if(self.zalama == nil) {
//            self.zalama = (self.storyboardLogin?.instantiateViewController(withIdentifier: "zalamaViewController") as? zalamaViewController)!
//        }
//
//        DispatchQueue.main.async {
//            if(self.loginViewController!.isViewLoaded || self.loginViewController!.view.window == nil) {
//                self.navigationTabBarController?.present(self.loginViewController!, animated: true, completion: nil)
//            }
//        }
//
////        DispatchQueue.main.async {
////            if(self.zalama!.isViewLoaded || self.zalama!.view.window == nil) {
////                self.navigationTabBarController?.present(self.zalama!, animated: true, completion: nil)
////            }
////        }
//
//        return self.loginViewController!
//
//    }
    
    func startPasswordAuthentication() -> AWSCognitoIdentityPasswordAuthentication {
        if (self.navigationController == nil) {
            self.navigationController = self.storyboardLogin?.instantiateViewController(withIdentifier: "LoginNavigationController") as? UINavigationController
        }
        
        if (self.loginViewController == nil) {
            self.loginViewController = self.navigationController?.viewControllers[0] as? LoginViewController
        }
        
        DispatchQueue.main.async {
            self.navigationController!.popToRootViewController(animated: true)
            if (!self.navigationController!.isViewLoaded
                || self.navigationController!.view.window == nil) {
                self.window?.rootViewController?.present(self.navigationController!,
                                                         animated: true,
                                                         completion: nil)
            }
            
        }
        return self.loginViewController!
    }
    
}

// special functions
extension AppDelegate {
    
    class func defaultUserPool() -> AWSCognitoIdentityUserPool {
        return AWSCognitoIdentityUserPool(forKey: Constants.CognitoConstants.AWSCognitoUserPoolsSignInProviderKey)
    }
    
    func setupCognitoUserPool() {
        
        // major settings to initiate user pool and sync aws cognito user pool
        let clientId:String = self.cognitoConfig!.getClientId()
        let poolId:String = self.cognitoConfig!.getPoolId()
        let clientSecret:String = self.cognitoConfig!.getClientSecret()
        let region:AWSRegionType = self.cognitoConfig!.getRegion()
        let providerKey = self.cognitoConfig!.getProviderKey()
        
        // service configuration
        let serviceConfiguration:AWSServiceConfiguration = AWSServiceConfiguration(region: region, credentialsProvider: nil)
        
        // cognito configuration
        let cognitoConfiguration:AWSCognitoIdentityUserPoolConfiguration = AWSCognitoIdentityUserPoolConfiguration(clientId: clientId, clientSecret: clientSecret, poolId: poolId)
        
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration, userPoolConfiguration: cognitoConfiguration, forKey: providerKey)
        
        // fetch the user pool client we initialized in above step
        let pool = AWSCognitoIdentityUserPool(forKey: Constants.CognitoConstants.AWSCognitoUserPoolsSignInProviderKey)
        pool.delegate = self
        
//        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "us-east-1:643eae94-6a9c-4cae-bb20-f6a9bcd4be46", identityProviderManager:pool)
//
//        credentialsProvider.credentials()
        
    }
}

