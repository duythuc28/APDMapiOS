//
//  APMapViewController.swift
//  CustomMap
//
//  Created by IOSDev on 1/27/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class APMapViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    //MARK: View life cycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.setUpView()
    }
    
    func setUpView () {
        self.loadMapView()
        self.createFloatingButton()
    }
    
    func createFloatingButton () {
        let fab = KCFloatingActionButton()
        fab.buttonColor = UIColor.orangeColor()
        fab.plusColor   = UIColor.whiteColor()
        fab.addItem(title: "Hello, World!")
        self.view.addSubview(fab)
    }
    
    func loadMapView () {
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 8.0)
        mapView.camera = camera
    }
    
    @IBAction func didSelectMenuButton(sender: AnyObject) {
        
    }
}
