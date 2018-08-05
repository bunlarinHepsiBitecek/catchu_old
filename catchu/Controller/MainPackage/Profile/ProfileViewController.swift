//
//  ProfileViewController.swift
//  catchu
//
//  Created by Erkut Baş on 8/5/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareViewLoadProcess()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func blurEffect() {
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        
    }
    


}
