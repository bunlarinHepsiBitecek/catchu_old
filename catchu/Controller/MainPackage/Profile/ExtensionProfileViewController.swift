//
//  ExtensionProfileViewController.swift
//  catchu
//
//  Created by Erkut Baş on 8/5/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

extension ProfileViewController {
    
    func prepareViewLoadProcess() {
        
        //self.searchProgressActive = false
        
        addSubViewIntoSafeArea()
        
    }
    
    func addSubViewIntoSafeArea() {
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(profileView)
        //profileView.initializeView()
        
        profileView.heightAnchor.constraint(equalToConstant: 734).isActive = true
        //profileView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        
        let safeGuide = self.view.safeAreaLayoutGuide
        profileView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        profileView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        profileView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor ).isActive = true
        
    }
    
}
