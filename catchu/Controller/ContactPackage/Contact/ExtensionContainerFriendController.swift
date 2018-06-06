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
        
        SectionBasedFriend.shared.emptyIfUserSelectedDictionary()
        
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
        SectionBasedFriend.shared.ifUserSelectedDictionary[cell.userFriend.userID] = true
        SectionBasedFriend.shared.addElementIntoSelectedUsers(user: cell.userFriend)
        
        /*
            check image is activated
         */
        UIView.transition(with: cell.friendSelectedIcon, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedIcon.image = #imageLiteral(resourceName: "check-mark.png")
            
        })
        
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
        UIView.transition(with: cell.friendSelectedIcon, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.friendSelectedIcon.image = nil
            
        })
        
        collectionView.reloadData()
        
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
        
        let cell = collectionView.cellForItem(at: indexPath) as? FriendCollectionViewCell
        
        if let i = SectionBasedFriend.shared.selectedUserArray.index(where: { $0.userID == cell?.selectedUser.userID}) {
            
            SectionBasedFriend.shared.selectedUserArray.remove(at: i)
        }
        
        collectionView.deleteItems(at: [indexPath])
        
        /* if collection view is reload, the user interface changes sharply, not smoothly */
        //collectionView.reloadData()
        
    }
    
}

