//
//  SearchResultTableViewCell.swift
//  catchu
//
//  Created by Erkut Baş on 7/31/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet var searchUserImage: UIImageViewDesign!
    @IBOutlet var searchUsername: UILabel!
    @IBOutlet var searchUserExtraLabel: UILabel!
    @IBOutlet var friendRequestButton: UIButton!
    
    var isFriendRequestButtonSelected: Bool!
    
    var searchResultUser = User()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func requestButtonTapped(_ sender: Any) {
        
        let client = RECatchUMobileAPIClient.default()
        
        let input = REFriendRequest()
        
        input?.requesterUserid = User.shared.userID
        input?.requestedUserid = searchResultUser.userID
        
        if searchResultUser.isUserHasAPrivateAccount {
            
            input?.requestType = Constants.AwsApiGatewayHttpRequestParameters.RequestOperationTypes.Friends.followRequest
            
        } else {
            
            input?.requestType = Constants.AwsApiGatewayHttpRequestParameters.RequestOperationTypes.Friends.createFollowDirectly
            
        }
        
        client.requestProcessPost(body: input!).continueWith { (taskResponse) -> Any? in
            
            print("taskresponse :\(taskResponse)")
            
            if (taskResponse.result?.error?.code?.boolValue)! {
                
                DispatchQueue.main.async {
                    
                    UIView.transition(with: self.friendRequestButton, duration: 0.3, options: .allowAnimatedContent, animations: {

                        if self.searchResultUser.isUserHasAPrivateAccount {
                            self.friendRequestButton.setTitle(LocalizedConstants.Contact.requested, for: .normal)
                            
                        } else {
                            self.friendRequestButton.setTitle(LocalizedConstants.Contact.friends, for: .normal)
                            
                        }
                        
                        self.blackTones()

                    })
                    
                }
                
            }
            
            return nil
            
        }
        
    }

}

extension SearchResultTableViewCell {
    
    // disableButton
    func disableRequestButton() {
        
        self.friendRequestButton.isEnabled = false
        
    }
    
    func enableRequestButton() {
        
        self.friendRequestButton.isEnabled = true
        
    }
    
    // initialize cell properties
    func initializeCellProperties() {

        self.searchUsername.text = Constants.CharacterConstants.SPACE
        self.searchUserExtraLabel.text = Constants.CharacterConstants.SPACE
        self.isFriendRequestButtonSelected = false

        initializeButtonSettings()

        self.searchUserImage.image = UIImage()

    }

    func initializeButtonSettings() {

        friendRequestButton.setTitle(LocalizedConstants.Contact.addFriend, for: .normal)

        friendRequestButton.layer.borderWidth = 1.0
        friendRequestButton.clipsToBounds = true
        friendRequestButton.layer.cornerRadius = 10

        self.defaultButtonColors()

    }

    func defaultButtonColors() {
        friendRequestButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        friendRequestButton.layer.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        friendRequestButton.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    func blackTones() {
        
        friendRequestButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        friendRequestButton.layer.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        friendRequestButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    func requestedMapping() {
        
        friendRequestButton.setTitle(LocalizedConstants.Contact.requested, for: .normal)
        
        blackTones()
        
    }
    
    func friendMapping() {
        
        friendRequestButton.setTitle(LocalizedConstants.Contact.friends, for: .normal)
        
        blackTones()
        
    }
    
    func setInitialButtonSettings() {

        friendRequestButton.setTitle(LocalizedConstants.Contact.addFriend, for: .normal)
        isFriendRequestButtonSelected = false

        friendRequestButton.layer.borderWidth = 1.0
        friendRequestButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        friendRequestButton.layer.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        friendRequestButton.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        friendRequestButton.clipsToBounds = true
        friendRequestButton.layer.cornerRadius = 10

    }

    func changeButtonSelectedSettings() {

        friendRequestButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        friendRequestButton.layer.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        friendRequestButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    }

    func changeButtonSelectedSettingsForPending() {

        friendRequestButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        friendRequestButton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.7692478895, blue: 0.8473142982, alpha: 1)
        friendRequestButton.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    }

    func changeButtonDeSelectedSettings() {

        friendRequestButton.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        friendRequestButton.layer.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        friendRequestButton.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)

    }
    
}

