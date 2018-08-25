//
//  EditProfileView.swift
//  catchu
//
//  Created by Erkut Baş on 8/20/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class EditProfileView: UIView {

    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var editProfileTitle: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        let client = RECatchUMobileAPIClient.default()
        
        let input = REGroupRequest()
        
        input?.requestType = "GET_GROUP_PARTICIPANT_LIST"
        input?.groupid = "6695e3a3-eafc-403f-90b5-073cd2169565"
        
        client.groupsPost(body: input!).continueWith { (task) -> Any? in
            
            print("task : \(task)")
            print("task data : \(task.result?.resultArrayParticipantList)")
            
            print("count : \(task.result?.resultArrayParticipantList?.count)")
            
            
            for item in (task.result?.resultArrayParticipantList)! {
                
                print("item : \(item.name)")
                
            }
            
            return nil
        }
        
    }
    
}
