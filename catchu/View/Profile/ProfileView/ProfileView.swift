//
//  ProfileView.swift
//  catchu
//
//  Created by Erkut Baş on 8/10/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ProfileView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {

    @IBOutlet var topView: UIView!
    @IBOutlet var mainDataCollection: UICollectionView!
    
    @IBOutlet var profileFrameTopConstraints: NSLayoutConstraint!
    
    private let profileFrameTopConstraintOriginalValue: CGFloat = 44.0
    private let profileFrameTopMinimalVisibleHeight: CGFloat  = 104.0
    private var imaginaryCollectionViewOffsetStartPosY: CGFloat = 0.0
    
    private var dragStartPos: CGPoint = CGPoint.zero
    
    private var profileFrameY: CGFloat  = 0.0
    private var dragDifference: CGFloat = 20.0
    
    enum Direction {
        case scroll
        case stop
        case up
        case down
    }
    
    var dragDirection = Direction.up
    
    
    func initializeProfileView() {
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.catchPanGesture(_:)))
        panGestureRecognizer.delegate = self
        self.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc func catchPanGesture(_ sender: UITapGestureRecognizer) {
        
        print("catchPanGesture triggered")
        
        if sender.state == UIGestureRecognizerState.began {
            
            print("gesture begans")
            
            let view     = sender.view
            let location = sender.location(in: view)
            let subview = view?.hitTest(location, with: nil)
            
            dragStartPos = sender.location(in: self)
            profileFrameY = self.topView.frame.origin.y + self.topView.frame.height
            
            print("profileFrameY : \(profileFrameY)")
            print("dragStartPos : \(dragStartPos)")
            
            if dragDirection == Direction.stop {
                
                dragDirection = (profileFrameTopConstraints.constant == profileFrameTopConstraintOriginalValue) ? Direction.up : Direction.down
                
                print("check1")
                
            }
            
            if (dragDirection == Direction.up && dragStartPos.y < profileFrameY + dragDifference) || (dragDirection == Direction.down && dragStartPos.y > profileFrameY) {
                
                dragDirection = Direction.stop
                
                print("check2")
                
            }
            
            
            
        } else if sender.state == UIGestureRecognizerState.changed {
            
            print("gesture changes")
            
            let currentPosition = sender.location(in: self)
            
            print("currentPosition : \(currentPosition)")
            print("dragDirection : \(dragDirection)")
            print("dragDifference : \(dragDifference)")
            print("profileFrameY : \(profileFrameY)")
            
            if dragDirection == Direction.up && currentPosition.y < profileFrameY - dragDifference {
                print("check3")
                profileFrameTopConstraints.constant = max(profileFrameTopMinimalVisibleHeight - self.topView.frame.height, currentPosition.y + dragDifference - topView.frame.height)
                
            } else if dragDirection == Direction.down && currentPosition.y > profileFrameY {
                print("check4")
                profileFrameTopConstraints.constant = min(profileFrameTopConstraintOriginalValue, currentPosition.y - topView.frame.height)
            
            } else if dragDirection == Direction.stop && mainDataCollection.contentOffset.y < 0 {
                
                print("check5")
                dragDirection = Direction.scroll
                
            } else if dragDirection == Direction.scroll {
                
                print("check6")
                profileFrameTopConstraints.constant = profileFrameTopMinimalVisibleHeight - self.topView.frame.height + currentPosition.y
                
            }
            
        
        } else {
            
            print("gesture gidiii")
            
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {

        print("shouldRecognizeSimultaneouslyWith starts")
        return true

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if kind == UICollectionElementKindSectionHeader {
//
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableCell", for: indexPath)
//
//            header.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
//
//            return header
//
//        } else {
//
//            return UICollectionReusableView()
//
//        }
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        // ofSize should be the same size of the headerView's label size:
//
//        return CGSize(width: mainDataCollection.frame.size.width, height: 60.0)
//
////        return CGSize(width: mainDataCollection.frame.size.width, height: myText.heightWithConstrainedWidth(font: UIFont.systemFont(ofSize: 17)))
//    }
    
}
