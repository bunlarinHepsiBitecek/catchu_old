//
//  LoaderControl.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 5/28/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//
import UIKit

class LoaderController: NSObject {
    
    static let shared = LoaderController()
    private let activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Private Methods -
    private func setupLoader() {
        removeLoader()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
    }
    
    func showLoader() {
        setupLoader()
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let currentView = appDel.window!.rootViewController!.view!
        
        DispatchQueue.main.async {
            self.activityIndicator.center = currentView.center
            self.activityIndicator.startAnimating()
            currentView.addSubview(self.activityIndicator)
//            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
    
    func removeLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
//            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func currentView() -> UIView {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        return appDel.window!.rootViewController!.view!
    }
}
