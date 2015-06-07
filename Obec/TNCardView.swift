//
//  TNCardsView.swift
//  Obec
//
//  Created by Ravern on 2/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

class TNCardView: UIView {
    
    var expandOnTap = true
    var collapseOnTap = true
    private var expanded = false
    private var orgFrame = CGRectZero
    
    var title: String!
    var author: String!
    var time: String!
    var location: String!
    
    var about: String!
    var tags: String!
    
    var content: String!
    var images: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        println("FUNCTION: INIT WITH CODER")
    }
    
    init() {
        super.init(frame: CGRectZero)
        
        clipsToBounds = false
        layer.shadowColor = UIColor.darkGrayColor().CGColor
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        backgroundColor = UIColor.foregroundColor()
    }
    
    func setup() {
        orgFrame = frame
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if expandOnTap && !expanded {
            expand()
        } else if collapseOnTap && expanded {
            collapse()
        }
    }
    
    func expand() {
        expanded = true
        orgFrame = frame
        superview!.bringSubviewToFront(self)
        animateFrame(CGRect(x: 0, y: 0, width: superview!.frame.size.width, height: superview!.frame.size.height), duration: 0.3)
    }
    
    func collapse() {
        expanded = false
        animateFrame(orgFrame, duration: 0.3)
    }
    
    func flip() {
        
    }
    
    func animatePos(position: CGPoint, duration: NSTimeInterval) {
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.frame.origin = position
        })
    }
    
    func animateSiz(size: CGSize, duration: NSTimeInterval) {
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.frame.size = size
        })
    }
    
    func animateFrame(frame: CGRect, duration: NSTimeInterval) {
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.frame = frame
        })
    }
}
