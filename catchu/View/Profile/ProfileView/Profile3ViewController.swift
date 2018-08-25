//
//  Profile3ViewController.swift
//  catchu
//
//  Created by Erkut Baş on 8/12/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class Profile3ViewController: UIViewController {

    @IBOutlet var zala: Zala!
    @IBOutlet var profile3View: Profile3View!
    @IBOutlet var mainView: UIView!
    @IBOutlet var externalMenuBarView: MenuBarView!
    @IBOutlet var slidingPagesView: SlidingPageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //got()
        prepareViewSettings()
        prepareMenubarSettings()
        prepareSlidingPageViewSettings()
        
        //self.navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //self.externalMenuBarView.selectFirstItemInCollectionView()
        
    }

}

extension Profile3ViewController {
    
    func got() {
        
        zala.translatesAutoresizingMaskIntoConstraints = false
        
        zala.initialize()
        self.mainView.addSubview(zala)
        
        let safeGuide = self.mainView.safeAreaLayoutGuide
        
        print("safeGuide : \(safeGuide)")
        
        zala.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        zala.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        zala.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        zala.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
        
    }
    
    
    func prepareViewSettings() {
        
        profile3View.translatesAutoresizingMaskIntoConstraints = false
        
        self.profile3View.initialize()
        self.profile3View.referenceSlidingPages = self.slidingPagesView
        self.profile3View.referenceSlidingPages = self.slidingPagesView
        self.mainView.addSubview(profile3View)
        
        let safeGuide = self.mainView.safeAreaLayoutGuide
        
        print("safeGuide : \(safeGuide)")

        profile3View.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        profile3View.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        profile3View.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        profile3View.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
        
    }
    
    func prepareMenubarSettings() {
        
        externalMenuBarView.translatesAutoresizingMaskIntoConstraints = false
        
        self.externalMenuBarView.initialize()
        self.externalMenuBarView.slidingPageReference = self.slidingPagesView
        
        self.profile3View.middleView.addSubview(self.externalMenuBarView)
        
        let safeGuide = self.profile3View.middleView.safeAreaLayoutGuide
 
        print("safeGuide : \(safeGuide)")

        self.externalMenuBarView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        self.externalMenuBarView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        self.externalMenuBarView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        self.externalMenuBarView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
    }
    
    func prepareSlidingPageViewSettings() {
        
        slidingPagesView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.slidingPagesView.initialize()
        
        self.slidingPagesView.menuBarReference = self.externalMenuBarView
        
        self.profile3View.bottomInsideView.addSubview(slidingPagesView)
        
        let safeGuide = self.profile3View.bottomInsideView.safeAreaLayoutGuide
        
        print("safeGuide : \(safeGuide)")
        
        self.slidingPagesView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        self.slidingPagesView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        self.slidingPagesView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        self.slidingPagesView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
        
    }
    
    
}
