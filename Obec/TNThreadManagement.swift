//
//  TNThreadManagement.swift
//  Obec
//
//  Created by Ravern on 2/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

class TNThreadManagement: NSObject {

    class func performAsync(function: () -> Void) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            function()
        })
    }
    
    class func performAsync(function: () -> Void, completion: () -> Void) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            function()
            completion()
        })
    }
}
