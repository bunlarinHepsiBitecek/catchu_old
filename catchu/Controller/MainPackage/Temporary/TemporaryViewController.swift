//
//  TemporaryViewController.swift
//  catchu
//
//  Created by Erkut Baş on 6/3/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import FirebaseFunctions
import UserNotifications

class TemporaryViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet var testImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        requestPermissionWithCompletionhandler { (granted) -> (Void) in
//
//            DispatchQueue.main.async {
//                if granted {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//            }
//
//        }
        
    }
    
    func requestPermissionWithCompletionhandler(completion: ((Bool) -> (Void))? ) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    
                    print("errorMessage :\(errorMessage)")
                    print("errorMessage :\(errorMessage.localizedDescription)")
                    
                    completion!(false)
                    return
                }
                
            } else {
                
                if granted {
                    
                    UNUserNotificationCenter.current().delegate = self
                    self.setNotificationCategories()
                    
                }
                
                completion!(true)
                
            }
            
        }
        
    }
    
    private func setNotificationCategories() {
        
        let likeAction = UNNotificationAction(identifier: "like", title: "Like", options: [])
        let replyAction = UNNotificationAction(identifier: "reply", title: "Reply", options: [])
        let archiveAction = UNNotificationAction(identifier: "archive", title: "Archive", options: [])
        let  ccommentAction = UNTextInputNotificationAction(identifier: "comment", title: "Comment", options: [])
        
        
        let localCat =  UNNotificationCategory(identifier: "local", actions: [likeAction], intentIdentifiers: [], options: [])
        
        let customCat =  UNNotificationCategory(identifier: "recipe", actions: [likeAction,ccommentAction], intentIdentifiers: [], options: [])
        
        let emailCat =  UNNotificationCategory(identifier: "email", actions: [replyAction, archiveAction], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([localCat, customCat, emailCat])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("GGGGGG")
        
        completionHandler([.alert, .sound, .badge])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goFriendView(_ sender: Any) {
        
        if let destinationViewController = UIStoryboard(name: Constants.StoryBoardID.Contact, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.ContactViewController) as? ContactViewController {
            
            present(destinationViewController, animated: true, completion: nil)
            
        }
    }
    @IBAction func printData(_ sender: Any) {
    
        SectionBasedFriend.shared.createInitialLetterBasedFriendDictionary()
        
        for item in SectionBasedFriend.shared.friendUsernameInitialBasedDictionary {
            
            for item2 in item.value as [User] {

                print("isUserSelected :\(item2.isUserSelected)")
                
            }
            
        }
        
        
        NotificationManager2.shared.registerForNotification()
        
        FirebaseManager.shared.getGeoFireData(currentLocation: GeoFireData.shared.currentLocation) { (result) in
        
            print("VVVVVVVVVVVVVVVVVVVVVVVVVV")
            
            if result {
                
                print("result : \(result)")
                
            }
            
        }
        
//        NotificationManager.shared.requestNotificationPermission(completion: { (granted) in
//
//            if granted {
//
//                NotificationManager.shared.initializeRegisterForRemoteNotification()
//                NotificationManager.shared.sendLocalNotification()
//
//            } else {
//
//                print("nah alırsın")
//
//            }
//
//
//        })
        
    
    }
    
    @IBAction func sendImage(_ sender: Any) {
        
        let function = Functions.functions()
        
        let uploadData = UIImagePNGRepresentation(testImage.image!)
        
        let data = ["yarro" : uploadData]
        
        function.httpsCallable("uploadImage").call(data) { (httpResult, error) in
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    print("errorCode : \(errorCode.localizedDescription)")
                    print("errorCode : \(errorCode.userInfo)")
                    
                }
                
            } else {
                
                if let data = httpResult?.data {
                    
                    print("data : \(data)")
                    
                }
                
            }
            
        }
            
    }
    
    
}
