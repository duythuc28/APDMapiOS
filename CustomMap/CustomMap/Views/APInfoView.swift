//
//  APInfoView.swift
//  CustomMap
//
//  Created by IOSDev on 2/4/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import UIKit

class APInfoView: UIView {

    @IBOutlet weak var infoDescription: UILabel!
    @IBOutlet weak var infoTitle      : UILabel!
    @IBOutlet weak var infoLogo       : UIImageView!
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
    }

}
