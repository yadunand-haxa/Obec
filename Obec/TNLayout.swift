//
//  TNLayout.swift
//  Obec
//
//  Created by Ravern on 3/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

class TNLayout: NSObject {
   
    class func mainWidth() -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    class func mainHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
    
    class func padding() -> CGFloat {
        return 10 * mainWidth() / 320.0
    }
    
    class func seventhWidth(noOfSevenths: Int) -> CGFloat {
        return ((mainWidth() - padding() * 8) / 7 * CGFloat(noOfSevenths) + padding() * CGFloat(noOfSevenths))
    }
    
    class func convert(value: CGFloat) -> CGFloat {
        return value / 320.0 * mainWidth()
    }
}
