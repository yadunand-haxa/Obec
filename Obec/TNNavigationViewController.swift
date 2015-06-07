//
//  TNNavigationViewController.swift
//  Obec
//
//  Created by Ravern on 4/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit

class TNNavigationViewController: UIViewController {
    
    //menu button
    var menuButton: UIImageView!
    var closeButton: UIImageView!
    var lineViews: [UIView]! = []
    var navigationButtons: [UIView]! = []
    
    var navigationView: UIView!
    
    var showing = false
    var animating = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton = UIImageView(image: UIImage(named: "Menu-Black.png"))
        menuButton.frame = CGRect(x: TNLayout.mainWidth() - 40, y: 10, width: 30, height: 30)
        menuButton.userInteractionEnabled = true
        var gr = UITapGestureRecognizer(target: self, action: "menuButtonTapped:")
        menuButton.addGestureRecognizer(gr)
        view.addSubview(menuButton)
        
        closeButton = UIImageView(image: UIImage(named: "Cancel-Black.png"))
        closeButton.frame = CGRect(x: TNLayout.mainWidth() - 40, y: 10, width: 30, height: 30)
        closeButton.userInteractionEnabled = true
        var gr2 = UITapGestureRecognizer(target: self, action: "closeButtonTapped:")
        closeButton.addGestureRecognizer(gr2)
        
        navigationView = UIView(frame: CGRect(x: 0, y: 0, width: TNLayout.mainWidth(), height: TNLayout.mainHeight()))
        navigationView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.94)
        //hiding
        navigationView.alpha = 0
        
        //navigation button creation
        navigationButtons.append(createNavigationButton("Home", icon: UIImage(named: "Home-Black.png")!))
        navigationButtons[0].frame.origin = CGPoint(x: TNLayout.mainWidth() / 2 - navigationButtons[0].frame.size.width / 2 - 300, y: 100)
        navigationView.addSubview(navigationButtons[0])
        var gr7 = UITapGestureRecognizer(target: self, action: "homeButtonPressed")
        navigationButtons[0].addGestureRecognizer(gr7)
        
        navigationButtons.append(createNavigationButton("Search", icon: UIImage(named: "Search-Black.png")!))
        navigationButtons[1].frame.origin = CGPoint(x: TNLayout.mainWidth() / 2 - navigationButtons[1].frame.size.width / 2 - 300, y: 157)
        navigationView.addSubview(navigationButtons[1])
        var gr8 = UITapGestureRecognizer(target: self, action: "searchButtonPressed")
        navigationButtons[1].addGestureRecognizer(gr8)
        
        navigationButtons.append(createNavigationButton("Filter", icon: UIImage(named: "Filter-Black.png")!))
        navigationButtons[2].frame.origin = CGPoint(x: TNLayout.mainWidth() / 2 - navigationButtons[2].frame.size.width / 2 - 300, y: 214)
        navigationView.addSubview(navigationButtons[2])
        var gr3 = UITapGestureRecognizer(target: self, action: "filterButtonPressed")
        navigationButtons[2].addGestureRecognizer(gr3)
        
        navigationButtons.append(createNavigationButton("Create", icon: UIImage(named: "Create-Black.png")!))
        navigationButtons[3].frame.origin = CGPoint(x: TNLayout.mainWidth() / 2 - navigationButtons[3].frame.size.width / 2 - 300, y: 271)
        navigationView.addSubview(navigationButtons[3])
        var gr4 = UITapGestureRecognizer(target: self, action: "createButtonPressed")
        navigationButtons[3].addGestureRecognizer(gr4)
        
        navigationButtons.append(createNavigationButton("Feeds", icon: UIImage(named: "Feeds-Black.png")!))
        navigationButtons[4].frame.origin = CGPoint(x: TNLayout.mainWidth() / 2 - navigationButtons[4].frame.size.width / 2 - 300, y: 328)
        navigationView.addSubview(navigationButtons[4])
        var gr5 = UITapGestureRecognizer(target: self, action: "feedsButtonPressed")
        navigationButtons[4].addGestureRecognizer(gr5)
        
        navigationButtons.append(createNavigationButton("Settings", icon: UIImage(named: "Settings-Black.png")!))
        navigationButtons[5].frame.origin = CGPoint(x: TNLayout.mainWidth() / 2 - navigationButtons[5].frame.size.width / 2 - 300, y: 385)
        navigationView.addSubview(navigationButtons[5])
        var gr6 = UITapGestureRecognizer(target: self, action: "settingsButtonPressed")
        navigationButtons[5].addGestureRecognizer(gr6)
        
        navigationView.addSubview(closeButton)
        view.addSubview(navigationView)
    }
    
    func menuButtonTapped(gr: UITapGestureRecognizer) {
        show()
    }
    
    func closeButtonTapped(gr: UITapGestureRecognizer) {
        hide()
    }
    
    func showNoAnim() {
        self.navigationView.alpha = 1
        var button = self.navigationButtons[0]
        self.navigationButtons[0].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
        button = self.navigationButtons[1]
        self.navigationButtons[1].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
        button = self.navigationButtons[2]
        self.navigationButtons[2].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
        button = self.navigationButtons[3]
        self.navigationButtons[3].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
        button = self.navigationButtons[4]
        self.navigationButtons[4].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
        button = self.navigationButtons[5]
        self.navigationButtons[5].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
    }
    
    func show() {
        if !animating {
            animating = true
            UIView.animateWithDuration(0.08, animations: { () -> Void in
                self.navigationView.alpha = 1
                }, completion: { (finished) -> Void in
                    UIView.animateWithDuration(0.08, animations: { () -> Void in
                        var button = self.navigationButtons[0]
                        self.navigationButtons[0].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
                        }, completion: { (finished) -> Void in
                            UIView.animateWithDuration(0.08, animations: { () -> Void in
                                var button = self.navigationButtons[1]
                                self.navigationButtons[1].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
                                }, completion: { (finished) -> Void in
                                    UIView.animateWithDuration(0.08, animations: { () -> Void in
                                        var button = self.navigationButtons[2]
                                        self.navigationButtons[2].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
                                        }, completion: { (finished) -> Void in
                                            UIView.animateWithDuration(0.08, animations: { () -> Void in
                                                var button = self.navigationButtons[3]
                                                self.navigationButtons[3].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
                                                }, completion: { (finished) -> Void in
                                                    UIView.animateWithDuration(0.08, animations: { () -> Void in
                                                        var button = self.navigationButtons[4]
                                                        self.navigationButtons[4].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
                                                        }, completion: { (finished) -> Void in
                                                            UIView.animateWithDuration(0.08, animations: { () -> Void in
                                                                var button = self.navigationButtons[5]
                                                                self.navigationButtons[5].frame.origin = CGPoint(x: button.frame.origin.x + 300, y: button.frame.origin.y)
                                                                }, completion: { (finished) -> Void in
                                                                    self.animating = false
                                                            })
                                                    })
                                            })
                                    })
                            })
                    })
            })
        }
    }
    
    func hide() {
        if !animating {
            animating = true
            UIView.animateWithDuration(0.08, animations: { () -> Void in
                var button = self.navigationButtons[0]
                self.navigationButtons[0].frame.origin = CGPoint(x: button.frame.origin.x - 300, y: button.frame.origin.y)
                }, completion: { (finished) -> Void in
                    UIView.animateWithDuration(0.08, animations: { () -> Void in
                        var button = self.navigationButtons[1]
                        self.navigationButtons[1].frame.origin = CGPoint(x: button.frame.origin.x - 300, y: button.frame.origin.y)
                        }, completion: { (finished) -> Void in
                            UIView.animateWithDuration(0.08, animations: { () -> Void in
                                var button = self.navigationButtons[2]
                                self.navigationButtons[2].frame.origin = CGPoint(x: button.frame.origin.x - 300, y: button.frame.origin.y)
                                }, completion: { (finished) -> Void in
                                    UIView.animateWithDuration(0.08, animations: { () -> Void in
                                        var button = self.navigationButtons[3]
                                        self.navigationButtons[3].frame.origin = CGPoint(x: button.frame.origin.x - 300, y: button.frame.origin.y)
                                        }, completion: { (finished) -> Void in
                                            UIView.animateWithDuration(0.08, animations: { () -> Void in
                                                var button = self.navigationButtons[4]
                                                self.navigationButtons[4].frame.origin = CGPoint(x: button.frame.origin.x - 300, y: button.frame.origin.y)
                                                }, completion: { (finished) -> Void in
                                                    UIView.animateWithDuration(0.08, animations: { () -> Void in
                                                        var button = self.navigationButtons[5]
                                                        self.navigationButtons[5].frame.origin = CGPoint(x: button.frame.origin.x - 300, y: button.frame.origin.y)
                                                        }, completion: { (finished) -> Void in
                                                            UIView.animateWithDuration(0.08, animations: { () -> Void in
                                                                self.navigationView.alpha = 0
                                                                }, completion: { (finished) -> Void in
                                                                    self.animating = false
                                                            })
                                                    })
                                            })
                                    })
                            })
                    })
            })
        }
    }

    func createNavigationButton(title: String, icon: UIImage) -> UIView {
        var button = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        
        var titleLabel = UILabel.createLabel(title, font: UIFont(name: "ChaparralPro-Bold", size: 20.0)!)
        var size = titleLabel.frame.size.height
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.frame.origin = CGPoint(x: size + 10, y: 22 - size / 2)
        
        var iconView = UIImageView(image: icon)
        iconView.frame = CGRect(x: 5, y: 20 - size / 2, width: size, height: size)
        
        button.frame.size = CGSize(width: 15 + titleLabel.frame.size.width + size, height: size + 10)
        
        button.addSubview(iconView)
        button.addSubview(titleLabel)
        
        return button
    }
    
    func homeButtonPressed() {
        performSegueWithIdentifier("home", sender: self)
    }
    
    func createButtonPressed() {
        performSegueWithIdentifier("create", sender: self)
    }
}
