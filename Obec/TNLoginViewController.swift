//
//  ViewController.swift
//  Obec
//
//  Created by Ravern on 2/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse

class TNLoginViewController: UIViewController {

    @IBOutlet var welcomeView: UIImageView!
    @IBOutlet var loginView: UIView!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UILabel!
    @IBOutlet var loginBackground: UIImageView!
    @IBOutlet var signupButton: UILabel!
    @IBOutlet var signupBackground: UIImageView!
    
    private static var first = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.tintColor = UIColor.whiteColor()
        passwordTextField.tintColor = UIColor.whiteColor()
        
        var gr = UITapGestureRecognizer(target: self, action: "hide")
        view.addGestureRecognizer(gr)
        
        loginButton.userInteractionEnabled = true
        var gr1 = UILongPressGestureRecognizer(target: self, action: "loginButtonPressed:")
        gr1.minimumPressDuration = 0.0
        loginButton.addGestureRecognizer(gr1)
        
        signupButton.userInteractionEnabled = true
        var gr2 = UILongPressGestureRecognizer(target: self, action: "signupButtonPressed:")
        gr2.minimumPressDuration = 0.0
        signupButton.addGestureRecognizer(gr2)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if TNLoginViewController.first {
            TNLoginViewController.first = false
            welcomeView.alpha = 0
            
            loginView.frame.origin = CGPoint(x: 0, y: TNLayout.mainHeight())
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.welcomeView.alpha = 1
                }) { (finished) -> Void in
                    sleep(2)
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.welcomeView.frame.origin = CGPoint(x: 0, y: -TNLayout.mainHeight())
                            self.loginView.frame.origin = CGPoint(x: 0, y: 0)
                        }) { (finished) -> Void in
                        
                }
            }
        }
    }
    
    func hide() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func loginButtonPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            loginButton.textColor = UIColor.whiteColor()
            loginBackground.image = UIImage(named: "BtnBackgroundActivated.png")
        } else if sender.state == UIGestureRecognizerState.Ended {
            loginButton.textColor = UIColor.blackColor()
            loginBackground.image = UIImage(named: "BtnBackground.png")
            login()
        }
    }
    
    func signupButtonPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            signupButton.textColor = UIColor.whiteColor()
            signupBackground.image = UIImage(named: "BtnBackgroundActivated.png")
        } else if sender.state == UIGestureRecognizerState.Ended {
            signupButton.textColor = UIColor.blackColor()
            signupBackground.image = UIImage(named: "BtnBackground.png")
            performSegueWithIdentifier("register", sender: self)
        }
    }
    
    @IBAction func textFieldDidEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textFieldEditingDidBegin(sender: UITextField) {
        if sender.text == "Your username" || sender.text == "Your password" {
            sender.text = ""
        }
    }
    
    func login() {
        loginButton.text = "Loading..."
        
        PFUser.logInWithUsernameInBackground(usernameTextField.text, password: passwordTextField.text) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.performSegueWithIdentifier("login", sender: self)
            } else {
                UIView.animateWithDuration(0.05, animations: { () -> Void in
                    self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                    self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.05, animations: { () -> Void in
                            self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x - 10, y: self.usernameTextField.frame.origin.y)
                            self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x - 10, y: self.passwordTextField.frame.origin.y)
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.05, animations: { () -> Void in
                                    self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                                    self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                                    }, completion: { (finished) -> Void in
                                        UIView.animateWithDuration(0.05, animations: { () -> Void in
                                            self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                                            self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                                            }, completion: { (finished) -> Void in
                                                UIView.animateWithDuration(0.05, animations: { () -> Void in
                                                    self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x - 10, y: self.usernameTextField.frame.origin.y)
                                                    self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x - 10, y: self.passwordTextField.frame.origin.y)
                                                    }, completion: { (finished) -> Void in
                                                        UIView.animateWithDuration(0.05, animations: { () -> Void in
                                                            self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                                                            self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                                                            }, completion: { (finished) -> Void in
                                                                self.passwordTextField.text = ""
                                                                self.loginButton.text = "Log in"
                                                        })
                                                })
                                        })
                                })
                        })
                })
            }
        }
    }
}