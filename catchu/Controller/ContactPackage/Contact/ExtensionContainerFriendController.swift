        //
//  ExtensionContainerFriendController.swift
//  catchu
//
//  Created by Erkut Baş on 6/5/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

// viewController override functions
extension ContainerFriendViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        
        SectionBasedFriend.shared.emptySectionBasedDictioanry()
        SectionBasedFriend.shared.emptyIfUserSelectedDictionary()
        
    }
    
    func prepareViewDidLoadProcess() {
        
        SectionBasedFriend.shared.createInitialLetterBasedFriendDictionary()
        print("_friendUsernameInitialBasedDictionary :\(SectionBasedFriend.shared.friendUsernameInitialBasedDictionary.count)")
        
        self.isCollectionViewOpen = false
        SectionBasedFriend.shared.emptyIfUserSelectedDictionary()
        
    }
    
    func collectionViewAnimationManagement() {
        
        if isCollectionViewOpen {
            
            if SectionBasedFriend.shared.selectedUserArray.isEmpty {
                
                closeCollectionViewSmootly()
                
            }
            
        } else {
            
            if !SectionBasedFriend.shared.selectedUserArray.isEmpty {
                
                openCollectionViewSmootly()
                
            }
            
        }
        
    }
    
    func openCollectionViewSmootly() {
        
        animateCollectionView(duration: 0.3, constantHeight: 90.0)
        isCollectionViewOpen = true
        
    }
    
    func closeCollectionViewSmootly() {
        
        animateCollectionView(duration: 0.3, constantHeight: 0)
        isCollectionViewOpen = false
    }
    
    func animateCollectionView(duration : TimeInterval, constantHeight : CGFloat) {
        
        self.collectionViewHeightConstraint.constant = constantHeight
        
        UIView.transition(with: collectionView, duration: duration, options: .transitionCrossDissolve, animations: {
            
            self.view.layoutIfNeeded()
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
    }
    
}

// tableView management
extension ContainerFriendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Collections.TableView.tableViewCellFriend, for: indexPath) as? FriendsTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        cell.friendImage.image = UIImage(named: "user.png")
        cell.userFriend = SectionBasedFriend.shared.returnUserFromSectionBasedDictionary(indexPath: indexPath)
        
        cell.friendName.text = cell.userFriend.name
        cell.friendImage.setImagesFromCacheOrFirebaseForFriend(cell.userFriend.profilePictureUrl)
        
        print("ifUserSelectedDictionary : \(SectionBasedFriend.shared.ifUserSelectedDictionary.count)")
        print("friendUsernameInitialBasedDictionary : \(SectionBasedFriend.shared.friendUsernameInitialBasedDictionary.count)")
        
        for item in SectionBasedFriend.shared.ifUserSelectedDictionary {
            
            print("item key : \(item.key)")
            print("item val : \(item.value)")
            
        }
        
        if cell.userFriend.isUserSelected {
            
            cell.friendSelectedIcon.image = #imageLiteral(resourceName: "check-mark.png")
            
            // after reloading tableview selected rows will be gone, that's why we need to implement code below
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            
        } else {
            
            cell.friendSelectedIcon.image = UIImage()
            
        }
        
        
        
//        if SectionBasedFriend.shared.ifUserSelectedDictionary[cell.userFriend.userID]! {
//
//            cell.friendSelectedIcon.image = #imageLiteral(resourceName: "check-mark.png")
//
//            // after reloading tableview selected rows will be gone, that's why we need to implement code below
//            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
//
//        } else {
//
//            cell.friendSelectedIcon.image = UIImage()
//
//        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SectionBasedFriend.shared.returnSectionNumber(index: section)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        print("SectionBasedFriend.shared.friendUsernameInitialBasedDictionary.keys.count :\(SectionBasedFriend.shared.friendUsernameInitialBasedDictionary.keys.count)")
        
        return SectionBasedFriend.shared.friendUsernameInitialBasedDictionary.keys.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return SectionBasedFriend.shared.friendSectionKeyData[section]
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Constants.NumericValues.rowHeight
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FriendsTableViewCell
        
        /*
            userID is marked as selected
            user is added into selected user array
        */
        //SectionBasedFriend.shared.ifUserSelectedDictionary[cell.userFriend.userID] = true
        cell.userFriend.indexPathTableView = indexPath
        cell.userFriend.isUserSelected = true
        SectionBasedFriend.shared.addElementIntoSelectedUsers(user: cell.userFriend)
        
        print("selected user indexPath : \(cell.userFriend.indexPathTableView)")
        
        /*
            check image is activated
         */
        cellSelectedIconManagement(indexPath: indexPath, iconManagement: .selected)
        
        collectionViewAnimationManagement()
        
        let selectedItemIndexPath = IndexPath(item: SectionBasedFriend.shared.selectedUserArray.count - 1, section: 0)
        collectionView.performBatchUpdates({
            
            collectionView.insertItems(at: [selectedItemIndexPath])
            
        }) { (result) in
            
            print("result : \(result)")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FriendsTableViewCell
        
        /*  userID is marked as deselected
            user is removed from selected user array
         */
        SectionBasedFriend.shared.ifUserSelectedDictionary[cell.userFriend.userID] = false
        
        if let i = SectionBasedFriend.shared.selectedUserArray.index(where: { $0.userID == cell.userFriend.userID}) {
            
            SectionBasedFriend.shared.selectedUserArray.remove(at: i)
        }
        
        /*
            uncheck image is activated
         */
        cellSelectedIconManagement(indexPath: indexPath, iconManagement: .deselected)
        
        print("cell.userFriend.indexPathCollectionView :\(cell.userFriend.indexPathCollectionView)")
        //collectionView.deleteItems(at: [cell.userFriend.indexPathCollectionView])
        
        collectionView.reloadData()
        collectionViewAnimationManagement()
        
    }
    
}

// collectionView management
extension ContainerFriendViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Collections.CollectionView.collectionViewCellFriend, for: indexPath) as? FriendCollectionViewCell else {
            
            return UICollectionViewCell()
            
        }
        
        if SectionBasedFriend.shared.selectedUserArray.count > 0 {
            
            UIView.transition(with: collectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {

                cell.selectedFriendImage.setImagesFromCacheOrFirebaseForFriend(SectionBasedFriend.shared.selectedUserArray[indexPath.row].profilePictureUrl)
                cell.selectedFriendName.text = SectionBasedFriend.shared.selectedUserArray[indexPath.row].name
                cell.selectedUser = SectionBasedFriend.shared.selectedUserArray[indexPath.row]
                
            }) { (result) in
                
                print("result : \(result)")
                
            }
            
        }
        
        if SectionBasedFriend.shared.selectedUserArray.count > 0 {
        
            
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return SectionBasedFriend.shared.selectedUserArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! FriendCollectionViewCell
        
        if let i = SectionBasedFriend.shared.selectedUserArray.index(where: { $0.userID == cell.selectedUser.userID}) {
            
            SectionBasedFriend.shared.selectedUserArray.remove(at: i)
        }
        
        collectionView.deleteItems(at: [indexPath])
        
        //SectionBasedFriend.shared.ifUserSelectedDictionary[cell.selectedUser.userID] = false
        
        /* if collection view is reload, the user interface changes sharply, not smoothly */
        //collectionView.reloadData()
        collectionViewAnimationManagement()
        
        /*
            while deleting from collectionView, the same user selected in tableView
            must be deselected as well
         */
        
        tableView.deselectRow(at: cell.selectedUser.indexPathTableView, animated: true)
        
        cellSelectedIconManagement(indexPath: cell.selectedUser.indexPathTableView, iconManagement: .deselected)
        
    }

    /*
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 1.0) {
            
            var newFrame = cell.frame
            
            cell.frame = CGRect(x: newFrame.origin.x + 60, y: newFrame.origin.y, width: newFrame.width, height: newFrame.height)
        }
        
    }*/
    
    /*
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 1, animations: {
            let newFrame = cell.frame
            cell.frame = CGRect(x: newFrame.origin.x + 60, y: newFrame.origin.y, width: newFrame.width, height: newFrame.height)
        })
    }*/
    
    // to select or deselect check icon inside each row of tableview
    func cellSelectedIconManagement(indexPath : IndexPath, iconManagement : IconManagement) {
        
        switch iconManagement {
        case .selected:
            selectCellIcon(indexPath: indexPath)
        case .deselected:
            deselectCellIcon(indexPath: indexPath)
        default:
            return
        }
        
    }
    
    func selectCellIcon(indexPath : IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FriendsTableViewCell
        
        UIView.transition(with: cell.friendSelectedIcon, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedIcon.image = #imageLiteral(resourceName: "check-mark.png")
            
        })
        
    }
    
    func deselectCellIcon(indexPath : IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FriendsTableViewCell
        
        UIView.transition(with: cell.friendSelectedIcon, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedIcon.image = nil
            
        })
        
    }
    
}

