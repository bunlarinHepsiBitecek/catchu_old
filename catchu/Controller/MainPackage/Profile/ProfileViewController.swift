//
//  ProfileViewController.swift
//  catchu
//
//  Created by Erkut Baş on 8/5/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var dataView: DataView!
    @IBOutlet var firstChildData: FirstChildDataView!
    @IBOutlet var secondChildData: SecondChildDataView!
    
    var child = DataView()
    
    var views = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataView.master = self

        self.view.addSubview(dataView)
        self.views.append(firstChildData)
        self.views.append(secondChildData)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        cell.contentView.addSubview(dataView)
        
        return cell
        
    }
    
    


}
