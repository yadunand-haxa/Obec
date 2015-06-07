//
//  TNXperience.swift
//  Obec
//
//  Created by Ravern on 5/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

class TNXperience: NSObject {
   
    var title: String!
    var author: String!
    var content: String!
    var tags: [String]!
    
    init(info: Dictionary<String, AnyObject>) {
        title = info["Title"] as! String
        author = info["Author"] as! String
        content = info["Content"] as! String
        tags = info["Tags"] as! [String]
    }
    
    func save() {
        
    }
}
