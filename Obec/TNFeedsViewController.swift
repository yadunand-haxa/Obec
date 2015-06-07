//
//  TNFeedsViewController.swift
//  Obec
//
//  Created by Ravern on 4/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse


class TNFeedsViewController: TNNavigationViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var feedTableView: UITableView!

    var xperiences: [TNXperience]! = []
    
    var exposed: [Bool]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var queryBulkBuy = PFQuery(className: "Bulk_Buy")
        var queryTuition = PFQuery(className: "Tuition_Centre")
        var queryTip = PFQuery(className: "DIY")
        
        queryBulkBuy.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if (error == nil) {
                //no error
                for var i = 0; i < objects!.count; i++ {
                    var pfobject = objects![i] as! PFObject
                    self.xperiences.append(TNBulkBuy(info: [
                        "Title" : pfobject["title"]!,
                        "Author" : pfobject["author"]!,
                        "Content" : pfobject["content"]!,
                        "Tags" : pfobject["tags"]!,
                        "Cost" : pfobject["cost"]!,
                        "MinPeopleInterested" : pfobject["minPeopleInterested"]!,
                        "PeopleInterested" : pfobject["peopleInterested"]!,
                        "Location" : pfobject["location"]!,
                        "Date" : NSDate()
                        ]))
                    self.exposed.append(false)
                }
            } else {
                
            }
            self.feedTableView.reloadData()
        }
        
        queryTuition.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if (error == nil) {
                //no error
                for var i = 0; i < objects!.count; i++ {
                    var pfobject = objects![i] as! PFObject
                    self.xperiences.append(TNBulkBuy(info: [
                        "Title" : pfobject["title"]!,
                        "Author" : pfobject["author"]!,
                        "Content" : pfobject["content"]!,
                        "Tags" : pfobject["tags"]!,
                        "Cost" : pfobject["cost"]!,
                        "MinPeopleInterested" : pfobject["minPeopleInterested"]!,
                        "PeopleInterested" : pfobject["peopleInterested"]!,
                        "Location" : pfobject["location"]!,
                        "Date" : NSDate()
                        ]))
                    self.exposed.append(false)
                }
            } else {
                
            }
            self.feedTableView.reloadData()
        }
        
        showNoAnim()
        hide()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xperiences.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if exposed[indexPath.row] {
            exposed[indexPath.row] = false
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        } else {
            exposed[indexPath.row] = true
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if exposed[indexPath.row] {
            return 415
        }
        return 165
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        var xperience = xperiences[indexPath.row]
        if xperience.isKindOfClass(TNBulkBuy) {
            cell = feedTableView.dequeueReusableCellWithIdentifier("BulkBuyCell") as! UITableViewCell
            
            var bulkBuy = xperience as! TNBulkBuy
            
            var dollarLabel = cell.viewWithTag(3) as! UILabel
            dollarLabel.text = "$\(Int(bulkBuy.cost))"
            if bulkBuy.cost > 999 { dollarLabel.font = UIFont(name: "Slabo27px-Regular", size: 36.0) }
            var centsLabel = cell.viewWithTag(4) as! UILabel
            centsLabel.text = ".\(Int((bulkBuy.cost * 100) % 100))"
            var signupsLabel = cell.viewWithTag(5) as! UILabel
            signupsLabel.text = "\(bulkBuy.peopleInterested.count) interested."
            
        } else if xperience.isKindOfClass(TNTip) {
            cell = feedTableView.dequeueReusableCellWithIdentifier("TipCell") as! UITableViewCell
            
            var tip = xperience as! TNTip
            
            var viewsLabel = cell.viewWithTag(3) as! UILabel
            
            var starsImageViews: [UIImageView] = []
            starsImageViews.append(cell.viewWithTag(4) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(5) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(6) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(7) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(8) as! UIImageView)
            
            for var i = tip.rating - 1; i >= 0; i = i - 1 {
                starsImageViews[i].image = UIImage(named: "Star-Full-Black.png")
            }
        } else if xperience.isKindOfClass(TNTuition) {
            cell = feedTableView.dequeueReusableCellWithIdentifier("TuitionCell") as! UITableViewCell
            
            var tuition = xperience as! TNTuition
            
            var dollarLabel = cell.viewWithTag(3) as! UILabel
            dollarLabel.text = "$\(Int(tuition.cost))"
            if tuition.cost > 999 { dollarLabel.font = UIFont(name: "Slabo27px-Regular", size: 36.0) }
            var centsLabel = cell.viewWithTag(4) as! UILabel
            centsLabel.text = ".\(Int((tuition.cost * 100) % 100))"
            
            var starsImageViews: [UIImageView] = []
            starsImageViews.append(cell.viewWithTag(5) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(6) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(7) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(8) as! UIImageView)
            starsImageViews.append(cell.viewWithTag(9) as! UIImageView)
            
            for var i = tuition.rating - 1; i >= 0; i = i - 1 {
                starsImageViews[i].image = UIImage(named: "Star-Full-Black.png")
            }
        }
        
        var titleLabel = cell.viewWithTag(1) as! UILabel
        titleLabel.text = xperience.title
        var authorLabel = cell.viewWithTag(2) as! UILabel
        authorLabel.text = xperience.author
        
        var view = UIView(frame: CGRect(x: 0, y: 165, width: TNLayout.mainWidth(), height: 250))
        view.backgroundColor = UIColor.blackColor()
        cell.addSubview(view)
        
        var aboutLabel = UILabel.createLabel("About", font: UIFont(name: "ChaparralPro-Regular", size: 30.0)!)
        aboutLabel.textColor = UIColor.whiteColor()
        aboutLabel.frame.origin = CGPoint(x: 20, y: 40)
        view.addSubview(aboutLabel)
        
        var contentLabel = UILabel.createLabel(xperience.content, font: UIFont(name: "ChaparralPro-Regular", size: 16.0)!)
        contentLabel.textAlignment = NSTextAlignment.Left
        contentLabel.textColor = UIColor.whiteColor()
        contentLabel.frame = CGRect(x: 120, y: 30, width: TNLayout.mainWidth() - 120 - 30, height: 190)
        view.addSubview(contentLabel)
        
        cell.clipsToBounds = true
        
        return cell
    }
}
