
//
//  TNBulkBuy.swift
//  Obec
//
//  Created by Ravern on 5/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse

class TNBulkBuy: TNXperience {
   
    var cost: Float!
    var minPeopleInterested: Int!
    var peopleInterested: [String]!
    var location: [String]!
    var date: NSDate!
    
    override init(info: Dictionary<String, AnyObject>) {
        super.init(info: [
            "Title" : info["Title"]!,
            "Author" : info["Author"]!,
            "Content" : info["Content"]!,
            "Tags" : info["Tags"]!,
            ])
        
        cost = info["Cost"] as! Float
//        minPeopleInterested = info["MinPeopleInterested"] as! Int
//        peopleInterested = info["PeopleInterested"] as! [String]
//        location = info["Location"] as! [String]
        date = info["Date"] as! NSDate
    }
    
    override func save() {
        var object = PFObject(className: "Bulk_Buy")
        object["title"] = title
        object["author"] = author
        object["content"] = content
        object["tags"] = tags
         object["cost"] = cost
        object["minPeopleInterested"] = minPeopleInterested
        object["peopleInterested"] = peopleInterested
        object["location"] = location
        object["date"] = date
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            
        }
    }
}
