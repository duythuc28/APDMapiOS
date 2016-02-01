//
//  APMenuViewController.swift
//  CustomMap
//
//  Created by IOSDev on 1/27/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import UIKit

class APMenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath)
        return cell
    }
    
}
