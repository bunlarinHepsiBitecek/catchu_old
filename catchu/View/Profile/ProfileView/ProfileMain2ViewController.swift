//
//  ProfileMain2ViewController.swift
//  catchu
//
//  Created by Erkut Baş on 8/11/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ProfileMain2ViewController: UIViewController {

    @IBOutlet var profileView2: ProfileView2!
    @IBOutlet var mainView: UIView!
    @IBOutlet var testView: TEST!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Erkut BAS"
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        profileView2.translatesAutoresizingMaskIntoConstraints = false

        self.mainView.addSubview(profileView2)
        profileView2.initializeProfileView2()

        // we do not need those below
//        profileView2.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        profileView2.widthAnchor.constraint(equalToConstant: 300).isActive = true

        let safeGuide = self.mainView.safeAreaLayoutGuide
        profileView2.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        profileView2.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        profileView2.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        profileView2.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        profileView2.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor ).isActive = true

//        testView.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.mainView.addSubview(testView)
//        testView.initializeProfileView2()
//        
////        testView.heightAnchor.constraint(equalToConstant: 500).isActive = true
////        testView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        
//        let safeGuide = self.mainView.safeAreaLayoutGuide
//        testView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
//        testView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
//        testView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
//        testView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
//        testView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor ).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
