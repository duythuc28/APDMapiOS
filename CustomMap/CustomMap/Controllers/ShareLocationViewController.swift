//
//  ShareLocationViewController.swift
//  CustomMap
//
//  Created by IOSDev on 3/1/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import UIKit

class ShareLocationViewController: UIViewController {

    var currentLocation = CLLocationCoordinate2D()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("current Location \(currentLocation.latitude)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
