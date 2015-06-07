//
//  AppDelegate.swift
//  Obec
//
//  Created by Ravern on 2/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class TNAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.setApplicationId("wUvPZoLT3F1B9VZigQOFLBkmXGNifZlHa8zeftX0", clientKey: "7yaITpfGxMQ2x2mI3w7e0qK9qd021LmsbV0Df4At")
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }
}

