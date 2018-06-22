//
//  TemporaryViewController.swift
//  catchu
//
//  Created by Erkut Baş on 6/3/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit
import FirebaseFunctions

class TemporaryViewController: UIViewController {

    @IBOutlet var testImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
