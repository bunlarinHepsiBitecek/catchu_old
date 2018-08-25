//
//  Profile3View.swift
//  catchu
//
//  Created by Erkut Baş on 8/12/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class Profile3View: UIView, UIGestureRecognizerDelegate {

    @IBOutlet var topView: UIView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var middleView: UIView!
    @IBOutlet var bottomInsideView: UIView!
    
    @IBOutlet var topViewTopConstraints: NSLayoutConstraint!
    @IBOutlet var bottomViewHeightConstraints: NSLayoutConstraint!
    
    private var topViewMinimumVisibleHeight : CGFloat = 0.0
    private let topViewMaximumTopConstraints : CGFloat  = -230.0
    private let topViewMinimumTopConstraints : CGFloat  = 0.0
    private var startPosition: CGPoint = CGPoint.zero
    
    private var scrollingProcess = GestureProcess.scrollingNormal
    
    @IBOutlet var bottomViewInsideHeightConstraints: NSLayoutConstraint!
    lazy var referenceSlidingPages = SlidingPageView()
    
    private var flag = false
    
    enum GestureProcess {
        case scrollingAutomaticallyStopTopPoint
        case scrollingNormal
        case scrollingBegan
    }
    
    enum Direction {
        case UP
        case DOWN
    }
    
    
    func initialize() {
        
        setupPanGestureRecognizer()
        
    }
    
    func setupPanGestureRecognizer() {
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panTriggered(_:)))
        panGestureRecognizer.delegate = self
        self.bottomView.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("shouldRecognizeSimultaneouslyWith starts")
        
        if let x = gestureRecognizer as? UIPanGestureRecognizer {
            
            let direction = x.velocity(in: self.bottomView)
            
            if direction.y < 0 {
                print("pic")
                return true
            } else {
                print("pust")
                return false
                
            }
            
        }
        
        return true
    }
    
    private func returnDirection(_ sender : UIPanGestureRecognizer) -> Direction {
        
        let direction = sender.velocity(in: self.bottomView)
        
        if direction.y < 0 {
            return Direction.UP
        } else {
            return Direction.DOWN
        }
    }
    
    @objc func panTriggered(_ sender : UIPanGestureRecognizer) {
        
        let direction = sender.velocity(in: self.bottomView)
        
        switch sender.state {
        case .began:
            print("began")
            
            startPosition = sender.location(in: self)
            print("startPosition : \(startPosition)")
            
        case .cancelled:
            print("cancelled")
           
        case .changed:
            print("changed")
            
            let currentPosition = sender.location(in: self)
            
            if returnDirection(sender) == Direction.UP && topViewTopConstraints.constant > topViewMaximumTopConstraints {
                
                print("check1")
                
                if topViewTopConstraints.constant > -230 {
                    
                    topViewTopConstraints.constant = currentPosition.y - startPosition.y
                    
                    print("topViewTopConstraints.constant : \(topViewTopConstraints.constant)")
                    print("bottomViewInsideHeightConstraints.constants : \(bottomViewInsideHeightConstraints.constant)")

                    
                    bottomViewInsideHeightConstraints.constant += -topViewTopConstraints.constant
                    print("bottomViewInsideHeightConstraints.constants : \(bottomViewInsideHeightConstraints.constant)")
                    
                    
                }
                
                referenceSlidingPages.takasiBomba()
//                referenceSlidingPages.changeflowlayoutsize(input: 600)
                
                
                //topViewTopConstraints.constant = topViewMinimumTopConstraints + currentPosition.y - startPosition.y

                print("topViewTopConstraints.constant : \(topViewTopConstraints.constant)")
                
            
            } else if returnDirection(sender) == Direction.DOWN && topViewTopConstraints.constant < topViewMinimumTopConstraints {
                
                print("check2")
                
                print("currentPosition.y : \(currentPosition.y)")
                print("startPosition.y : \(startPosition.y)")
                print("topViewTopConstraints.constant : \(topViewTopConstraints.constant)")
                
//                if scrollingProcess == GestureProcess.scrollingAutomaticallyStopTopPoint {
//                    print("YYY")
//                    topViewTopConstraints.constant = topViewMaximumTopConstraints + currentPosition.y - startPosition.y
//
//                } else {
//
//                    if topViewTopConstraints.constant < 0 {
//                        print("XXX")
//                        topViewTopConstraints.constant = currentPosition.y - startPosition.y
//
//                    }
//
//                }
                
                if flag {
                    
                    topViewTopConstraints.constant = topViewMaximumTopConstraints + currentPosition.y - startPosition.y
                    
                } else {
                    
                    if topViewTopConstraints.constant < 0 {
                        print("XXX")
                        topViewTopConstraints.constant = currentPosition.y - startPosition.y
                        
                    }
                    
                }
                
//                if topViewTopConstraints.constant < 0 {
//                    print("XXX")
//                    topViewTopConstraints.constant = currentPosition.y - startPosition.y
//
//                }
                
                
                
                //topViewTopConstraints.constant = topViewMaximumTopConstraints + currentPosition.y - startPosition.y
                
                print("topViewTopConstraints.constant : \(topViewTopConstraints.constant)")
                
            }
            
        case .ended:
            print("ended")
            
            switch returnDirection(sender) {
            case .UP:
                print("UP")
                
                print("topViewTopConstraints.constant : \(topViewTopConstraints.constant)")
                
                topViewTopConstraints.constant = topViewMaximumTopConstraints
                
                UIView.animate(withDuration: 0.3,
                               delay: 0.0,
                               options: UIViewAnimationOptions.curveEaseOut,
                               animations: {
                                
                                self.layoutIfNeeded()
                                
                }, completion: { (result) in
                    
                    if result {
                        
                        self.scrollingProcess = GestureProcess.scrollingAutomaticallyStopTopPoint
                        
                    }
                    
                })
                
                flag = true
                
            case .DOWN:
                print("DOWN")
                
                print("topViewTopConstraints.constant : \(topViewTopConstraints.constant)")
                
                topViewTopConstraints.constant = topViewMinimumTopConstraints
                
                UIView.animate(withDuration: 0.3,
                               delay: 0.0,
                               options: UIViewAnimationOptions.curveEaseOut,
                               animations: {
                                
                                self.layoutIfNeeded()
                                
                }, completion: { (result) in
                    
                    if result {
                        
                        self.scrollingProcess = GestureProcess.scrollingNormal
                        
                    }
                    
                })
                
                flag = false
            }

        default:
            print("nothing")
        }
    }
    
}
