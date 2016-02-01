//
//  APMapViewController.swift
//  CustomMap
//
//  Created by IOSDev on 1/27/16.
//  Copyright © 2016 ALP. All rights reserve
//

import UIKit
import KCFloatingActionButton
class APMapViewController: UIViewController ,CLLocationManagerDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    //MARK: View life cycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create reveal menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        RESTRequest(subPath: "", functionName: "location_type", requestMethod: RESTRequestMethod.GET).invokeRequest { (result, error) -> Void in
//            print (result)
//            print (result.result.error!)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setUpView()
    }
    
    // MARK: Setup Map
    func setUpView () {
        self.loadMapView()
        self.createFloatingButton()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    /**
     Create float button on the left corner
     */
    func createFloatingButton () {
        // Create float button
        let floatButton = KCFloatingActionButton(frame: CGRect(x: 10, y: self.mapView.frame.size.height, width:42, height: 42))
        floatButton.buttonColor = UIColor.orangeColor()
        floatButton.plusColor = UIColor.whiteColor()
        
        // Create reload button
        let reloadButton = KCFloatingActionButtonItem()
        reloadButton.icon = UIImage(named: "Reload")
        reloadButton.buttonColor = UIColor.orangeColor()
        
        // Create share button
        let shareButton = KCFloatingActionButtonItem()
        shareButton.icon = UIImage(named: "Add")
        shareButton.buttonColor = UIColor.orangeColor()
        
        // Craete info button
        let infoButton = KCFloatingActionButtonItem()
        infoButton.icon = UIImage(named: "Info")
        infoButton.buttonColor = UIColor.orangeColor()
        
        floatButton.addItem(item: reloadButton) { (KCFloatingActionButtonItem) -> Void in
            print ("Test")
        }
        
        floatButton.addItem(item: shareButton) { (KCFloatingActionButtonItem) -> Void in
            print ("Test")
        }
        
        floatButton.addItem(item: infoButton) { (KCFloatingActionButtonItem) -> Void in
            print ("Test")
        }
        
        self.view.addSubview(floatButton)
    }
    /**
     Setup map view
     */
    func loadMapView () {
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 8.0)
        mapView.camera = camera
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    @IBAction func didSelectMenuButton(sender: AnyObject) {
        
    }
    
    // MARK: - CLLocationManagerDelegate

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
        
    }
}
