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
        
        let currentView = self.currentView()
        
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
    
    func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func currentViewController() -> UIViewController {
        
        return (appDelegate().window?.rootViewController)!
        
    }
    
    func currentView() -> UIView {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        return appDel.window!.rootViewController!.view!
    }
    
    func goToSettings() {
        let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
        if UIApplication.shared.canOpenURL(settingsUrl!)  {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl!, completionHandler: { (success) in
                })
            }
            else  {
                let url = URL(string : "prefs:root=")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.openURL(url!)
                }
            }
        }
    }
    
}
