//
//  SearchResultTableViewCell.swift
//  catchu
//
//  Created by Erkut Baş on 7/31/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet var searchUserImage: UIImageViewDesign!
    @IBOutlet var searchUsername: UILabel!
    @IBOutlet var searchUserExtraLabel: UILabel!
    
    var searchResultUser = User()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
