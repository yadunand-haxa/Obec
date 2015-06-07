//
//  TNUIKitHelpers.swift
//  Obec
//
//  Created by Ravern on 3/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

extension UILabel {
    
    //creates a label with frame: CGRectZero
    class func createLabel(text: NSString, font: UIFont) -> UILabel {
        var label = UILabel(frame: CGRectZero)
        label = UILabel(frame: CGRectZero)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.blackColor()
        label.text = text as String
        label.numberOfLines = 0
        label.font = font
        label.sizeToFit()
        
        return label
    }
}
