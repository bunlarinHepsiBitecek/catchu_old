//
//  ExtensionContainerSearchResultViewController.swift
//  catchu
//
//  Created by Erkut Baş on 7/31/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

extension ContainerSearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if Search.shared.isSearchProgressActive {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Collections.TableView.tableViewCellSearchProcess, for: indexPath) as? SearchProcessTableViewCell else {
                
                return UITableViewCell()
                
            }
            
            cell.searchProcessInformation.text = "Searching for " + searchKey!
            
            cell.activityIndicator.hidesWhenStopped = true
            cell.activityIndicator.activityIndicatorViewStyle = .gray
    
            DispatchQueue.main.async {
                
                cell.activityIndicator.center = cell.viewForActivityIndicator.center
                cell.activityIndicator.startAnimating()
                cell.viewForActivityIndicator.addSubview(cell.activityIndicator)
            }
            
            return cell
          
        }  else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Collections.TableView.tableViewCellSearchResult, for: indexPath) as? SearchResultTableViewCell else {
                
                return UITableViewCell()
                
            }
            
            cell.searchUsername.text = "erkutbas"
            cell.searchUserExtraLabel.text = "Erkut Bas"
            
            return cell
            
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Constants.NumericValues.rowHeightSearch
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return Constants.NumberOrSections.section1
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Search Result"
        
    }
    
    
}
