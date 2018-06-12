//
//  DropPinViewController.swift
//  catchu
//
//  Created by Remzi YILDIRIM on 6/8/18.
//  Copyright © 2018 Remzi YILDIRIM. All rights reserved.
//

import UIKit

class DropPinViewController: UIViewController {
    
    // MARK: outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var mapView: MapView!
    @IBOutlet var shareView: ShareView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func customization() {
        // MapView setup in ContainerView
        self.containerView.addSubview(self.mapView)
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.containerView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: margins.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
            ])
        LocationManager.shared.delegete = self
        LocationManager.shared.startUpdateLocation()
        
        // MARK: ShareView setup under ContainerView
        self.view.addSubview(self.shareView)
        self.shareView.translatesAutoresizingMaskIntoConstraints = false
        let mainViewMargin = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            shareView.leadingAnchor.constraint(equalTo: mainViewMargin.leadingAnchor),
            shareView.trailingAnchor.constraint(equalTo: mainViewMargin.trailingAnchor),
            shareView.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 10),
            shareView.bottomAnchor.constraint(equalTo: mainViewMargin.bottomAnchor)
            ])
    }
}

extension DropPinViewController: LocationManagerDelegate {
    func didUpdateLocation() {
        // MARK: when location update starting centerMap
        if let currentLocation = LocationManager.shared.currentLocation {
            mapView.coordinate = currentLocation.coordinate
        }
    }
}
