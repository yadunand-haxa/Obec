////
////  TNCardsViewController.swift
////  Obec
////
////  Created by Ravern on 2/6/15.
////  Copyright (c) 2015 Nobelium. All rights reserved.
////
//
//import UIKit
//
//class TNCardsViewController: UIViewController {
//    
//    var scrollView: UIScrollView!
//    var cards: [TNCardView]! = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = UIColor.backgroundColor()
//        
//        var navBar = TNNavigationBar()
//        navBar.backgroundColor = UIColor.primaryColor()
//        view.addSubview(navBar)
//        
//        cards.append(TNOneCardView(position: CGPoint(x: TNLayout.padding(), y: navBar.frame.size.height + TNLayout.padding()), info: ["Title" : "I Love Math Seminars", "Author" : "Ravern Koh"]))
//        view.addSubview(cards.first!)
//    }
//}
