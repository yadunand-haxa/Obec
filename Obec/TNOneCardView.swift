////
////  TNOneCardView.swift
////  Obec
////
////  Created by Ravern on 3/6/15.
////  Copyright (c) 2015 Nobelium. All rights reserved.
////
//
//import UIKit
//
//class TNOneCardView: TNCardView {
//    
//    var dividerView: UIView!
//    
//    var titleLabel: UILabel!
//    var authorLabel: UILabel!
//    var timeLabel: UILabel!
//    var locationLabel: UILabel!
//    
//    var aboutLabel: UILabel!
//    var tagsLabel: UILabel!
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        println("FUNCTION: INIT WITH CODER")
//    }
//    
//    init(position: CGPoint, info: Dictionary<String, String>) {
//        super.init()
//        
//        dividerView = UIView(frame: CGRect(x: TNLayout.convert(9), y: TNLayout.convert(10), width: TNLayout.convert(2), height: TNLayout.convert(90)))
//        dividerView.backgroundColor = UIColor.darkGrayColor()
//        addSubview(dividerView)
//        
//        titleLabel = UILabel.createTitleLabel(info["Title"]!, size: TNLayout.convert(23.0))
//        titleLabel.textAlignment = NSTextAlignment.Left
//        titleLabel.frame = CGRect(x: TNLayout.convert(20), y: TNLayout.convert(10), width: TNLayout.convert(145), height: TNLayout.convert(70))
//        addSubview(titleLabel)
//        
//        authorLabel = UILabel.createSubtitleLabel("by " + (info["Author"]!), size: TNLayout.convert(16.0))
//        authorLabel.textAlignment = NSTextAlignment.Left
//        authorLabel.frame = CGRect(x: TNLayout.convert(20), y: TNLayout.convert(80), width: TNLayout.convert(145), height: TNLayout.convert(20))
//        addSubview(authorLabel)
//        
//        frame = CGRect(x: position.x, y: position.y, width: TNLayout.seventhWidth(4), height: TNLayout.convert(220))
//        
//        setup()
//    }
//}
