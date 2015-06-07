//
//  TNColor.swift
//  Obec
//
//  Created by Ravern on 2/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

extension UIColor {
    
    private static let privatePrimaryColor: UIColor! = UIColor.hex(0x101110)
    private static let privateBackgroundColor: UIColor! = UIColor.hex(0xf9f9f9)
    private static let privateForegroundColor: UIColor! = UIColor.hex(0xffffff)
//    private static let privateAccentColors: [UIColor]! = [
//        UIColor.hex(0x5C6BC0),
//        UIColor.hex(0x42A5F5),
//        UIColor.hex(0x1E88E5),
//        UIColor.hex(0x9575CD),
//        UIColor.hex(0x80DEEA),
//        UIColor.hex(0x2196F3),
//        UIColor.hex(0x4DD0E1),
//        UIColor.hex(0x03A9F4),
//        UIColor.hex(0xB39DDB)
////        UIColor.hex(0xAAAAAA),
////        UIColor.hex(0xAFAFAF),
////        UIColor.hex(0xBCBCBC),
////        UIColor.hex(0xCDCDCD),
////        UIColor.hex(0xDADADA),
////        UIColor.hex(0xDEDEDE),
//    ]
    
    class func hex(hex: Int) -> UIColor {
        return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
    class func primaryColor() -> UIColor {
        return privatePrimaryColor
    }
    
    class func backgroundColor() -> UIColor {
        return privateBackgroundColor
    }
    
    class func foregroundColor() -> UIColor {
        return privateForegroundColor
    }
    
//    class func accentColor(index: Int) -> UIColor {
//        if index >= privateAccentColors.count { return privateAccentColors.first! }
//        return privateAccentColors[index]
//    }
//    
//    class func randomAccentColor() -> UIColor {
//        return privateAccentColors[Int(arc4random()) % Int(privateAccentColors.count)]
//    }
}

extension UIFont {
    
    class func titleFont(size: CGFloat) -> UIFont {
        return UIFont(name: "RobotoCondensed-Bold"/*.HelveticaNeueDeskInterface-Bold*/, size: size)!
    }
    
    class func subtitleFont(size: CGFloat) -> UIFont {
        return UIFont(name: "RobotoCondensed-Regular"/*.HelveticaNeueDeskInterface-MediumP4*/, size: size)!
    }
    
    class func textFont(size: CGFloat) -> UIFont {
        return UIFont(name: "RobotoCondensed-Light"/*.HelveticaNeueDeskInterface-Regular*/, size: size)!
    }
}