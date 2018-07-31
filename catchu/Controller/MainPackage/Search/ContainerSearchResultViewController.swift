//
//  ContainerSearchResultViewController.swift
//  catchu
//
//  Created by Erkut Baş on 7/31/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ContainerSearchResultViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    // parent view controller object to update value from container view controller to contact view on contact view controller
    var parentReferenceSearchViewController : SearchViewController?
    
    var searchKey : String?
    var takasi : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        takasi = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
