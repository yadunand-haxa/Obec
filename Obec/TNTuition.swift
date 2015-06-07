//
//  TNTuition.swift
//  Obec
//
//  Created by Ravern on 5/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse

class TNTuition: TNXperience {
    
    var cost: Float!
    var location: [String]!
    var date: NSDate!
    var rating: Int!
    var reviews: [[String]]!

    override init(info: Dictionary<String, AnyObject>) {
        super.init(info: [
            "Title" : info["Title"]!,
            "Author" : info["Author"]!,
            "Content" : info["Content"]!,
            "Tags" : info["Tags"]!,
            ])
        
        cost = info["Cost"] as! Float
        location = info["Location"] as! [String]
        rating = info["Rating"] as! Int
        date = info["Date"] as! NSDate
        reviews = info["Reviews"] as! [[String]]
    }
    
    override func save() {
        var object = PFObject(className: "Tuition_Centre")
        object["title"] = title
        object["author"] = author
        object["content"] = content
        object["tags"] = tags
        object["cost"] = cost
        object["location"] = location
        object["date"] = date
        object["rating"] = rating
        object["reviews"] = reviews
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            
        }
    }
}
