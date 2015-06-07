//
//  TNCreateViewController.swift
//  Obec
//
//  Created by Ravern on 5/6/15.
//  Copyright (c) 2015 Nobelium. All rights reserved.
//

import UIKit
import Parse
class TNCreateViewController: TNNavigationViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var tagsTextField: UITextField!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var categoriesTextField: UITextField!
    @IBOutlet var stageTextField: UITextField!
    
    @IBOutlet var contentTextView: UITextView!
    
    @IBOutlet var firstIcon: UIImageView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondIcon: UIImageView!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var thirdIcon: UIImageView!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var thirdTextField: UITextField!
    @IBOutlet var fourthIcon: UIImageView!
    @IBOutlet var fourthLabel: UILabel!
    @IBOutlet var fourthTextField: UITextField!
    
    @IBOutlet var firstNextBackground: UIImageView!
    @IBOutlet var firstNextButton: UILabel!
    @IBOutlet var secondNextBackground: UIImageView!
    @IBOutlet var secondNextButton: UILabel!
    @IBOutlet var createBackground: UIImageView!
    @IBOutlet var createButton: UILabel!
    
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var thirdView: UIView!
    
    var categoryPickerView: UIPickerView!
    var stagePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNoAnim()
        hide()
        
        
        categoryPickerView = UIPickerView()
        stagePickerView = UIPickerView()
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        stagePickerView.dataSource = self
        stagePickerView.delegate = self
        
        categoriesTextField.inputView = categoryPickerView
        stageTextField.inputView = stagePickerView
    }
    
    override func viewDidAppear(animated: Bool) {
        var gr = UILongPressGestureRecognizer(target: self, action: "firstNextPressed:")
        gr.minimumPressDuration = 0.0
        firstNextButton.addGestureRecognizer(gr)
        
        var gr2 = UILongPressGestureRecognizer(target: self, action: "secondNextPressed:")
        gr2.minimumPressDuration = 0.0
        secondNextButton.addGestureRecognizer(gr2)
        
        var gr3 = UILongPressGestureRecognizer(target: self, action: "createPressed:")
        gr3.minimumPressDuration = 0.0
        createButton.addGestureRecognizer(gr3)
        
        var gr4 = UITapGestureRecognizer(target: self, action: "viewTapped")
        view.addGestureRecognizer(gr4)
        
        secondView.alpha = 0
        thirdView.alpha = 0
        
        firstNextButton.userInteractionEnabled = true
        secondNextButton.userInteractionEnabled = true
        createButton.userInteractionEnabled = true
    }
    
    func viewTapped() {
        resignFirstResponders()
    }
    
    func firstNextPressed(sender: UILongPressGestureRecognizer) {
        
//        Post["Title"] = titleTextField.text
//        Post["Tags"] = tagsTextField.text
//        Post["Categories"] = categoriesTextField.text
//        Post["Stages"] = stageTextField.text
//        Post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Object has been saved.")
//        }
        if sender.state == UIGestureRecognizerState.Began {
            firstNextButton.textColor = UIColor.whiteColor()
            firstNextBackground.image = UIImage(named: "BtnBackgroundActivated.png")
        } else if sender.state == UIGestureRecognizerState.Ended {
            resignFirstResponders()
            firstNextButton.textColor = UIColor.blackColor()
            firstNextBackground.image = UIImage(named: "BtnBackground.png")
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.firstView.alpha = 0
                }) { (finished) -> Void in
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.secondView.alpha = 1
                        }) { (finished) -> Void in
                            
                    }
            }
        }
    }
    
    func secondNextPressed(sender: UILongPressGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            
            secondNextButton.textColor = UIColor.whiteColor()
            secondNextBackground.image = UIImage(named: "BtnBackgroundActivated.png")
        } else if sender.state == UIGestureRecognizerState.Ended {
//            if categoriesTextField.text == "BulkBuy" {
//            Bulk_Buy["content"] = contentTextView.text
//            } else if categoriesTextField.text == "Tips" {
//                DIY["content"] = contentTextView.text
//            } else if categoriesTextField.text == "Tuition" {
//                Tuition_Centres["content"] = contentTextView.text
//            }
            
            resignFirstResponders()
            
            selectFields()
            
            secondNextButton.textColor = UIColor.blackColor()
            secondNextBackground.image = UIImage(named: "BtnBackground.png")

            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.secondView.alpha = 0
                }) { (finished) -> Void in
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.thirdView.alpha = 1
                        }) { (finished) -> Void in
                        
                    }
            }
        }
    }
    
    func selectFields() {
        if categoriesTextField.text == "BulkBuy" {
            firstLabel.text = "Cost"
            firstTextField.text = "Enter cost"
            firstTextField.keyboardType = UIKeyboardType.DecimalPad
            
            secondIcon.image = UIImage(named: "Title-White.png")
            secondLabel.text = "Min Number of People"
            secondTextField.text = "Enter number"
            secondTextField.keyboardType = UIKeyboardType.NumberPad
            
            thirdIcon.image = UIImage(named: "Location-Black.png")
            thirdLabel.text = "Location"
            thirdTextField.text = "Enter Location"
            thirdTextField.keyboardType = UIKeyboardType.Default

            fourthIcon.image = UIImage(named: "Calendar-Black.png")
            fourthLabel.text = "Date"
            fourthTextField.text = "Enter Date DD/MM"
            fourthTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
            
        } else if categoriesTextField.text == "Tips" {
            
        } else if categoriesTextField.text == "Tuition" {
            
        }
    }
    
    func createPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Ended {
            if categoriesTextField.text == "BulkBuy" {
                var dict: [String : AnyObject] = [String : AnyObject]()
                dict["Title"] = titleTextField.text
                dict["Author"] = "Sharmela"
                dict["Date"] = NSDate()
                dict["Content"] = contentTextView.text
                dict["Tags"] = ["Workinh", "dwaad"]
                dict["Cost"] = (firstTextField.text as NSString).floatValue
                dict["MinPeopleInterested"] = (secondTextField.text as NSString).integerValue
                dict["PeopleInterested"] = [""]
                dict["Location"] = [(thirdTextField.text as NSString)]
                
                var xperience = TNBulkBuy(info: dict)
                xperience.save()
                
                performSegueWithIdentifier("home", sender: self)
                
            }
            if categoriesTextField.text == "Tips" {
                TNBulkBuy(info: [
                    "Title": titleTextField.text,
                    "Author": "Sharmela",
                    "Content": contentTextView.text,
                    "Tags": []
                    ])
            }
            if categoriesTextField.text == "Tuition" {
                TNBulkBuy(info: [
                    "Title" : titleTextField.text,
                    "Author" : "Sharmela",
                    "Content" : contentTextView.text,
                    "Tags" : [],
                    "Cost": 10
                    ])
            }
        }
        
    }
    
    @IBAction func textFieldDidEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
        resignFirstResponders()
    }
    
    @IBAction func textFieldEditingDidBegin(sender: UITextField) {
        if sender.text != "Post title" {
            sender.text = ""
        }
    }
    
    func resignFirstResponders() {
        titleTextField.resignFirstResponder()
        tagsTextField.resignFirstResponder()
        categoriesTextField.resignFirstResponder()
        stageTextField.resignFirstResponder()
        contentTextView.resignFirstResponder()
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        thirdTextField.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView {
            return 3
        } else {
            return 5
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView == categoryPickerView {
            if row == 0 {
                return "BulkBuy"
            } else if row == 1 {
                return "Tuition"
            } else if row == 2 {
                return "Tips"
            }
        } else {
            if row == 0 {
                return "Embryo"
            } else if row == 1 {
                return "Young"
            } else if row == 2 {
                return "Teens"
            } else if row == 3 {
                return "Adults"
            } else if row == 4 {
                return "Elder"
            }
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView {
            if row == 0 {
                categoriesTextField.text = "BulkBuy"
            } else if row == 1 {
                categoriesTextField.text = "Tuition"
            } else if row == 2 {
                categoriesTextField.text = "Tips"
            }
        } else {
            if row == 0 {
                stageTextField.text = "Embryo"
            } else if row == 1 {
                stageTextField.text = "Young"
            } else if row == 2 {
                stageTextField.text = "Teens"
            } else if row == 3 {
                stageTextField.text = "Adults"
            } else if row == 4 {
                stageTextField.text = "Elder"
            }
        }
    }
}
