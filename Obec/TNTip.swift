//
//  TNTip.swift
//  Obec
//
//  Created by Ravern on 5/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse

class TNTip: TNXperience {
    
    var cost: Float!
    var location: [String]!
    var rating: Int!
    var date: NSDate!
    
    override init(info: Dictionary<String, AnyObject>) {
        super.init(info: [
            "Title" : info["Title"]!,
            "Author" : info["Author"]!,
            "Content" : info["Content"]!,
            "Tags" : info["Tags"]!,
            ])
        
        cost = info["Cost"] as! Float
        rating = info["Rating"] as! Int
        date = info["Date"] as! NSDate
    }
    
    override func save() {
        var object = PFObject(className: "DIY")
        object["title"] = title
        object["author"] = author
        object["content"] = content
        object["tags"] = tags
        object["cost"] = cost
        object["location"] = location
        object["rating"] = rating
        object["date"] = date
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            
        }
    }
}
