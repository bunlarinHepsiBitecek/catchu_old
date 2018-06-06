//
//  ExtensionContactViewController.swift
//  catchu
//
//  Created by Erkut Baş on 6/4/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

extension ContactViewController {
    
    func prepareViewLoadProcess() {
        
        addSubViewIntoSafeArea()
        startTableViewDataSourceManagement()

    }

    func addSubViewIntoSafeArea() {
        
        contactView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contactView)
        contactView.initializeView()
        
        contactView.heightAnchor.constraint(equalToConstant: 734).isActive = true
        //contactView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        
        let safeGuide = self.view.safeAreaLayoutGuide
        contactView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        contactView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        contactView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        contactView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor ).isActive = true
        
        
    }
    
    func startTableViewDataSourceManagement() {
        
        SectionBasedFriend.shared.createInitialLetterBasedFriendDictionary()
        
    }
    
    
}
