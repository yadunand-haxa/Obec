////
////  TNstring.swift
////
////
////  Created by Yadunand on 4/6/15.
////
////
//
//import UIKit
//
//extension String {
//    
//    class func chunk1(string: String,
//    
//    class func chunk(stringDef: String) -> String
//    {
//        var string = stringDef.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
//        var stringLength = count(string)
//        
//        
//        let pointerDef: Int = stringLength
//        var pointer: Int = pointerDef-1
//        var stringArr = Array(string)[pointer]
//        
//        while (true) {
//            if (pointer == 0) {
//                return string
//            }
//            stringArr = Array(string)[pointer]
//            
//            if (stringArr != " ")
//            {
//                pointer--
//            }
//                
//            else
//            {
//                var string1 = string.substringWithRange(Range<String.Index>(start: advance(string.startIndex, 0), end: advance(string.startIndex, (pointer+1))))
//                var string2 = string.substringWithRange(Range<String.Index>(start: advance(string.startIndex, pointer+1), end: advance(string.endIndex, 0)))
//                
//                var resultString = string1 + "\n" + string2
//                return resultString
//                
//            }
//            
//        }
//        
//        
//    }
//    
//    
//}