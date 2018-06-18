//
//  ContactView.swift
//  catchu
//
//  Created by Erkut Baş on 6/4/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ContactView: UIView {
    
    @IBOutlet var topView: UIViewDesign!
    @IBOutlet var containerViewFriend: UIView!
    @IBOutlet var containerGroup: UIView!
    
    @IBOutlet var confirmationButton: UIButton!
    @IBOutlet var pageLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    
    @IBOutlet var segmentedButton: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var selectedRowCountLabel: UILabel!
    @IBOutlet var seperatorLable: UILabel!
    @IBOutlet var totalCountLabel: UILabel!
    
    // let's create a MasterController object
    var referenceMasterViewController : ContactViewController!
    
    var boolenValueForCountColorManagement : Bool!

    func initializeView() {
        
        self.topView.alpha = 0.0
        boolenValueForCountColorManagement = false
        
        UIView.animate(withDuration: 0.5) {
            
            self.topView.alpha = 1.0
            
            
        }
        
        self.containerViewFriend.alpha = 1.0
        self.containerGroup.alpha = 0.0
        
        //addBorderLineToTopView()
        setTitles()
        setCounterLabels()
        counterLabelsManagement()
        setSelectedUserCounterLabel()
        searchBarPropertyManagement()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    
        SectionBasedFriend.shared = SectionBasedFriend()
        referenceMasterViewController.dismiss(animated: true, completion: nil)
        
    }
    
    func addBorderLineToTopView() {
        
        topView.addBottomBorderWithColor(color: .lightGray, width: 1.0)
        
    }
    
    func setCounterLabels() {
        
        totalCountLabel.text = returnTotalRowCountOfTableView()
        
    }
    
    func setSelectedUserCounterLabel() {
        
        UIView.transition(with: selectedRowCountLabel, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.selectedRowCountLabel.text = self.returnSelectedUserFriendCount()
        })
        
    }
    
    func setTitles() {
        
        setLabelTitle()
        setButtonTitles()
        
    }
    
    func setLabelTitle() {
        
        pageLabel.text = LocalizedConstants.TitleValues.LabelTitle.addParticipant
        
    }
    
    func setButtonTitles() {
        
        cancelButton.setTitle(LocalizedConstants.TitleValues.ButtonTitle.cancel, for: .normal)
        confirmationButton.setTitle(LocalizedConstants.TitleValues.ButtonTitle.next, for: .normal)
        
        segmentedButton.setTitle(LocalizedConstants.TitleValues.ButtonTitle.friend, forSegmentAt: 0)
        segmentedButton.setTitle(LocalizedConstants.TitleValues.ButtonTitle.group, forSegmentAt: 1)
        segmentedButton.setTitle(LocalizedConstants.TitleValues.ButtonTitle.newGroup, forSegmentAt: 2)
        
    }
    
    func returnTotalRowCountOfTableView() -> String {
        
        let tempCount = SectionBasedFriend.shared.friendUsernameInitialBasedDictionary.count
        let countStringValue : String = String(tempCount)
     
        return countStringValue
        
    }
    
    func makeDisableCounterLabels() {
        
        UIView.transition(with: self, duration: 0.4, options: .transitionCrossDissolve, animations: {
            
            self.totalCountLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.selectedRowCountLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.seperatorLable.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        })
        
    }
    
    func makeEnableCounterLabels() {
        
        UIView.transition(with: self, duration: 0.4, options: .transitionCrossDissolve, animations: {
            
            self.totalCountLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.selectedRowCountLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.seperatorLable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        })
        
    }
    
    func counterLabelsManagement() {
        
        if SectionBasedFriend.shared.selectedUserArray.count > 0 {
            
            makeEnableCounterLabels()
            
        } else {
            
            makeDisableCounterLabels()
        }
        
    }
    
    func returnSelectedUserFriendCount() -> String{
        
        let tempCount = SectionBasedFriend.shared.selectedUserArray.count

        let countStringValue : String = String(tempCount)
        
        if tempCount <= Constants.NumericConstants.INTEGER_ZERO {
            
            makeDisableCounterLabels()
            boolenValueForCountColorManagement = true
            
        } else {
            
            if boolenValueForCountColorManagement {

                makeEnableCounterLabels()
                boolenValueForCountColorManagement = false
                
            }
            
        }
        
        return countStringValue
        
    }
    
}

// extension for searchBar
extension ContactView : UISearchBarDelegate {
    
    // to make searchBar textField background invisible
    func searchBarPropertyManagement() {
        
        let textFieldInsideSearchBar = searchBar.value(forKey: Constants.searchBarProperties.searchField) as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor.black
        textFieldInsideSearchBar?.backgroundColor = UIColor.lightGray
        
        searchBar.searchBarStyle = .minimal
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // empty searchResult array
        SectionBasedFriend.shared.emptySearchResult()
        
        if !searchText.isEmpty {
            
            print("searchBar userFriendList count : \(User.shared.userFriendList.count)")
            
            for item in User.shared.userFriendList {
                
                print("item key : \(item.key)")
                print("item val : \(item.value)")
                
                if let user = item.value as User? {
                    
                    print("name : \(user.name)")
                    
                    var arraySplit = [Substring]()
                    
                    arraySplit = item.value.name.split(separator: " ")
                    
                    for item in arraySplit {
                        
                        if item.lowercased().hasPrefix((searchBar.text?.lowercased())!) {
                            
                            SectionBasedFriend.shared.searchResult.append(user)
                            break
                            
                        }
                        
                    }
                    
                }
                
            }
            
            searchBar.setShowsCancelButton(true, animated: true)
            
            SectionBasedFriend.shared.isSearchModeActivated = true
            
        } else {
            
            print("search text field is empty")
            SectionBasedFriend.shared.isSearchModeActivated = false
            searchBar.setShowsCancelButton(false, animated: true)
            self.searchBar.endEditing(true)
            
        }
        
        referenceMasterViewController.childReferenceFriendContainerFriendController?.tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchBar.endEditing(true)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = Constants.CharacterConstants.SPACE
        self.searchBar.endEditing(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.searchBar.endEditing(true)
        
    }
    
    
}
