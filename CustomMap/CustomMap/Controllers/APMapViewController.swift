//
//  APMapViewController.swift
//  CustomMap
//
//  Created by IOSDev on 1/27/16.
//  Copyright © 2016 ALP. All rights reserve
//

import UIKit
import NVActivityIndicatorView
import LiquidFloatingActionButton


class APMapViewController: UIViewController ,CLLocationManagerDelegate , GMSMapViewDelegate, LiquidFloatingActionButtonDataSource, LiquidFloatingActionButtonDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var cells: [LiquidFloatingCell] = []
    var floatingActionButton: LiquidFloatingActionButton!
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
        // Create reveal menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.revealViewController().customSlideOutMenu(self.revealViewController(), revealWidth: self.view.frame.size.width * 0.8, toogleAnimationType: SWRevealToggleAnimationType.EaseOut, toogleAnimationDuration: 0.3)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
//        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.center.x - 15, y: self.view.center.y - 15, width: 30, height: 30))
//        activityIndicatorView.color = UIColor.orangeColor()
//        activityIndicatorView.type = NVActivityIndicatorType.CubeTransition
//        activityIndicatorView.startAnimation()
//        self.view.addSubview(activityIndicatorView)
        
        RESTRequest(subPath: "get", functionName: String.kDefineWebServiceAPIGetLocationURL , requestMethod: RESTRequestMethod.GET).invokeRequest { (result, error) -> Void in
            
        }
        let cellFactory: (String) -> LiquidFloatingCell = { (iconName) in
            return LiquidFloatingCell(icon: UIImage(named: iconName)!)
        }
        cells.append(cellFactory("Add"))
        cells.append(cellFactory("Info"))
        cells.append(cellFactory("Reload"))
        self.setUpView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingActionButton.frame = CGRect(x: 10, y: self.mapView.frame.size.height - 26, width:52, height: 52)
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
        floatingActionButton = LiquidFloatingActionButton(frame: CGRect(x: 10, y: self.mapView.frame.size.height, width:52, height: 52))
        floatingActionButton.dataSource = self
        floatingActionButton.delegate = self
        floatingActionButton.animateStyle = .Up
        floatingActionButton.color = UIColor.orangeColor()
        self.view.addSubview(floatingActionButton)
    }
    /**
     Setup map view
     */
    func loadMapView () {
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(10.775659, longitude: 106.700424, zoom: 15)
        mapView.camera = camera
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        
        let position = CLLocationCoordinate2DMake(10.775659,106.700424)
        let london = GMSMarker(position: position)
        london.title = "London";
        london.icon = UIImage(named: "Marker")
//        london.infoWindowAnchor = CGPoint(x: 0.44, y: 0.45)
        london.map = mapView;
    }
    
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        let infoWindow = NSBundle.mainBundle().loadNibNamed("APInfoView", owner: self, options: nil)[0] as! APInfoView
        infoWindow.infoTitle.text = "Test"
        infoWindow.infoDescription.text = "Test test"
        return infoWindow
    }
    
//    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
//
//        let infoWindow = NSBundle.mainBundle().loadNibNamed("APInfoView", owner: self, options: nil)[0] as! APInfoView
//        let startPoint = mapView.projection.pointForCoordinate(marker.position)
//        let markerPoint = CGPoint(x: startPoint.x - 20, y: startPoint.y)
//        let startView  = UIView(frame: CGRect(origin: markerPoint, size:CGSize(width: 50, height: 50)))
//        self.view.addSubview(startView)
//
//        return true
//    }
    
    
    
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
    // MARK: - Liquid Floating Data Source & Delegate
    
    func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return cells.count
    }
    func cellForIndex(index: Int) -> LiquidFloatingCell {
        return cells[index]
    }
    
    func liquidFloatingActionButton(liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        switch(index) {
        case 0:
            self.performSegueWithIdentifier("showShareLocationVC", sender: self)
        case 1:
            break
        case 2:
            break
        default:
            break
        }
        liquidFloatingActionButton.close()
    }
    
    // MARK: - Navigation Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showShareLocationVC") {
            let shareLocationViewController = segue.destinationViewController as? ShareLocationViewController
//            if let currentLocation = locationManager.location {
//                shareLocationViewController?.currentLocation = currentLocation
//            }
            shareLocationViewController?.currentLocation = (locationManager.location?.coordinate)!
        }
    }
    
}
