//
//  ContainerFriendViewController.swift
//  catchu
//
//  Created by Erkut Baş on 6/5/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ContainerFriendViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var isCollectionViewOpen : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareViewDidLoadProcess()
        
        collectionViewHeightConstraint.constant = 0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
