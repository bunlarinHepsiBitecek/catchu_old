//
//  ProfileView.swift
//  catchu
//
//  Created by Erkut Baş on 8/5/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet var userProfileTableView: UITableView!
    
    
}

extension ProfileView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
        
    }
    
    
    
    
}
