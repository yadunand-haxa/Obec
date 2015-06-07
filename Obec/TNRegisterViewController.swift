//
//  TNRegisterViewController.swift
//  Obec
//
//  Created by Ravern on 4/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse

class TNRegisterViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var loginButton: UILabel!
    @IBOutlet var loginBackground: UIImageView!
    @IBOutlet var signupButton: UILabel!
    @IBOutlet var signupBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.tintColor = UIColor.whiteColor()
        passwordTextField.tintColor = UIColor.whiteColor()
         confirmPasswordTextField.tintColor = UIColor.whiteColor()
        emailTextField.tintColor = UIColor.whiteColor()
        
        var gr = UITapGestureRecognizer(target: self, action: "hide")
        view.addGestureRecognizer(gr)
        
        signupButton.userInteractionEnabled = true
        var gr1 = UILongPressGestureRecognizer(target: self, action: "signupButtonPressed:")
        gr1.minimumPressDuration = 0.0
        signupButton.addGestureRecognizer(gr1)
        
        loginButton.userInteractionEnabled = true
        var gr2 = UILongPressGestureRecognizer(target: self, action: "loginButtonPressed:")
        gr2.minimumPressDuration = 0.0
        loginButton.addGestureRecognizer(gr2)
    }
    
    func hide() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    @IBAction func textFieldDidEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textFieldEditingDidBegin(sender: UITextField) {
        if sender.text == "Your username" || sender.text == "Your password" || sender.text == "Your password again" || sender.text == "Your email" {
            sender.text = ""
        }
    }
    
    func loginButtonPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            loginButton.textColor = UIColor.whiteColor()
            loginBackground.image = UIImage(named: "BtnBackgroundActivated.png")
        } else if sender.state == UIGestureRecognizerState.Ended {
            loginButton.textColor = UIColor.blackColor()
            loginBackground.image = UIImage(named: "BtnBackground.png")
            performSegueWithIdentifier("log in", sender: self)
        }
    }
    
    func signupButtonPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            signupButton.textColor = UIColor.whiteColor()
            signupBackground.image = UIImage(named: "BtnBackgroundActivated.png")
        } else if sender.state == UIGestureRecognizerState.Ended {
            signupButton.textColor = UIColor.blackColor()
            signupBackground.image = UIImage(named: "BtnBackground.png")
            signup()
        }
    }
    
    func signup() {
        signupButton.text = "Loading..."
        if passwordTextField.text == confirmPasswordTextField.text {
            var user = PFUser()
            user.username = usernameTextField.text
            user.password = passwordTextField.text
            user.email = emailTextField.text
            
            user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                self.signupButton.text = "Sign up"
                    if success {
                        self.performSegueWithIdentifier("login", sender: self)
                    } else {
                        self.shake()
                    }
            }
        } else {
            signupButton.text = "Sign up"
            shake()
        }
    }
    
    func shake() {
        UIView.animateWithDuration(0.05, animations: { () -> Void in
            self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
            self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
            self.confirmPasswordTextField.frame.origin = CGPoint(x: self.confirmPasswordTextField.frame.origin.x + 5, y: self.confirmPasswordTextField.frame.origin.y)
            self.emailTextField.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x + 5, y: self.emailTextField.frame.origin.y)
            }, completion: { (finished) -> Void in
                UIView.animateWithDuration(0.05, animations: { () -> Void in
                    self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x - 10, y: self.usernameTextField.frame.origin.y)
                    self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x - 10, y: self.passwordTextField.frame.origin.y)
                    self.confirmPasswordTextField.frame.origin = CGPoint(x: self.confirmPasswordTextField.frame.origin.x - 10, y: self.confirmPasswordTextField.frame.origin.y)
                    self.emailTextField.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x - 10, y: self.emailTextField.frame.origin.y)
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.05, animations: { () -> Void in
                            self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                            self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                            self.confirmPasswordTextField.frame.origin = CGPoint(x: self.confirmPasswordTextField.frame.origin.x + 5, y: self.confirmPasswordTextField.frame.origin.y)
                            self.emailTextField.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x + 5, y: self.emailTextField.frame.origin.y)
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.05, animations: { () -> Void in
                                    self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                                    self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                                    self.confirmPasswordTextField.frame.origin = CGPoint(x: self.confirmPasswordTextField.frame.origin.x + 5, y: self.confirmPasswordTextField.frame.origin.y)
                                    self.emailTextField.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x + 5, y: self.emailTextField.frame.origin.y)
                                    }, completion: { (finished) -> Void in
                                        UIView.animateWithDuration(0.05, animations: { () -> Void in
                                            self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x - 10, y: self.usernameTextField.frame.origin.y)
                                            self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x - 10, y: self.passwordTextField.frame.origin.y)
                                            self.confirmPasswordTextField.frame.origin = CGPoint(x: self.confirmPasswordTextField.frame.origin.x - 10, y: self.confirmPasswordTextField.frame.origin.y)
                                            self.emailTextField.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x - 10, y: self.emailTextField.frame.origin.y)
                                            }, completion: { (finished) -> Void in
                                                UIView.animateWithDuration(0.05, animations: { () -> Void in
                                                    self.usernameTextField.frame.origin = CGPoint(x: self.usernameTextField.frame.origin.x + 5, y: self.usernameTextField.frame.origin.y)
                                                    self.passwordTextField.frame.origin = CGPoint(x: self.passwordTextField.frame.origin.x + 5, y: self.passwordTextField.frame.origin.y)
                                                    self.confirmPasswordTextField.frame.origin = CGPoint(x: self.confirmPasswordTextField.frame.origin.x + 5, y: self.confirmPasswordTextField.frame.origin.y)
                                                    self.emailTextField.frame.origin = CGPoint(x: self.emailTextField.frame.origin.x + 5, y: self.emailTextField.frame.origin.y)
                                                    }, completion: { (finished) -> Void in
                                                        self.passwordTextField.text = ""
                                                        self.confirmPasswordTextField.text = ""
                                                })
                                        })
                                })
                        })
                })
        })
    }
}
