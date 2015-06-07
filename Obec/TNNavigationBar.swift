////
////  TNNavigationBar.swift
////  Obec
////
////  Created by Ravern on 2/6/15.
////  Copyright (c) 2015 Nobelium. All rights reserved.
////
//
//import UIKit
//
//class TNNavigationBar: UIView {
//
//    var titleItem: UILabel!
//    var leftItem: UILabel!
//    var rightItem: UILabel!
//    
//    var createButtonTapped: (() -> Void)!
//    var filterButtonTapped: (() -> Void)!
//    var searchButtonTapped: (() -> Void)!
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        println("FUNCTION: INIT WITH CODER")
//    }
//    
//    init() {
//        super.init(frame: CGRect(x: 0, y: 0, width: TNLayout.mainWidth(), height: TNLayout.convert(50)))
//        
//        leftItem = UILabel.createTitleLabel("OBEC", size: TNLayout.convert(26.0))
//        leftItem.textColor = UIColor.whiteColor()
//        var pos = leftPosition(leftItem.frame)
//        leftItem.frame = CGRect(x: pos.x, y: pos.y, width: leftItem.frame.width, height: leftItem.frame.height)
//        addSubview(leftItem)
//        
//        rightItem = UILabel.createSubtitleLabel("Menu", size: TNLayout.convert(17.0))
//        rightItem.textColor = UIColor.whiteColor()
//        var pos2 = rightPosition(rightItem.frame)
//        rightItem.frame = CGRect(x: pos2.x, y: pos2.y, width: rightItem.frame.width, height: rightItem.frame.height)
//        addSubview(rightItem)
//    }
//    
//    private func centerPosition(frame: CGRect) -> CGPoint {
//        return CGPoint(x: (self.frame.size.width - frame.size.width) / 2, y: (self.frame.size.height - frame.size.height) / 2)
//    }
//    
//    private func leftPosition(frame: CGRect) -> CGPoint {
//        return CGPoint(x: TNLayout.convert(30), y: (self.frame.size.height - frame.size.height) / 2)
//    }
//    
//    private func rightPosition(frame: CGRect) -> CGPoint {
//        return CGPoint(x: self.frame.size.width - frame.size.width - TNLayout.convert(30), y: (self.frame.size.height - frame.size.height) / 2)
//    }
//}
