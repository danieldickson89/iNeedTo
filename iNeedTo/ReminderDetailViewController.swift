//
//  ReminderDetailViewController.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class ReminderDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var reminder: Reminder?
    var levelSelected: Bool?
    var categorySelected: Bool?
    var category: String = ""
    var level: String = ""

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var schoolButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let reminder = reminder {
            updateWithReminder(reminder)
        }
        self.titleTextField.delegate = self
        self.notesTextView.delegate = self
        
        lowButton.layer.cornerRadius = 8
        mediumButton.layer.cornerRadius = 8
        highButton.layer.cornerRadius = 8
        homeButton.layer.cornerRadius = 8
        workButton.layer.cornerRadius = 8
        schoolButton.layer.cornerRadius = 8
        
        titleTextField.layer.borderWidth = 3.0
        titleTextField.layer.borderColor = UIColor.myGrayColor().CGColor
        titleTextField.layer.cornerRadius = 6.0
        notesTextView.layer.borderWidth = 3.0
        notesTextView.layer.borderColor = UIColor.myGrayColor().CGColor
        notesTextView.layer.cornerRadius = 6.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        //doneEditingButton.hidden = false
    }
    
    func updateReminder() {
        let title = titleTextField.text
        let text = notesTextView.text
        let theCategory = category
        let theLevel = level
        
        if let reminder = self.reminder {
            reminder.title = title
            reminder.text = text
            reminder.category = theCategory
            reminder.level = theLevel
        } else {
            let newReminder = Reminder(title: title!, text: text, category: theCategory, level: theLevel)
            ReminderController.sharedController.addReminder(newReminder)
        }
    }
    
    func updateWithReminder(reminder: Reminder) {
        self.reminder = reminder
        titleTextField.text = reminder.title
        notesTextView.text = reminder.text
        
        if let level = reminder.level {
            switch level {
            case "cLow": pushLowbutton()
            case "bMedium": pushMediumButton()
            case "aHigh": pushHighButton()
            default: pushLowbutton()
            }
        }
        
        if let category = reminder.category {
            switch category {
            case "home": pushHomeButton()
            case "work": pushWorkButton()
            case "school": pushSchoolButton()
            default: pushWorkButton()
            }
        }
    }
    
    func pushLowbutton() {
        lowButton.backgroundColor = UIColor.myYellowColor()
        mediumButton.backgroundColor = UIColor.myGrayColor()
        highButton.backgroundColor = UIColor.myGrayColor()
        level = "cLow" // sort low priority at bottom
    }
    
    func pushMediumButton() {
        lowButton.backgroundColor = UIColor.myGrayColor()
        mediumButton.backgroundColor = UIColor.myOrangeColor()
        highButton.backgroundColor = UIColor.myGrayColor()
        level = "bMedium" // sort medium priority in the middle
    }
    
    func pushHighButton() {
        lowButton.backgroundColor = UIColor.myGrayColor()
        mediumButton.backgroundColor = UIColor.myGrayColor()
        highButton.backgroundColor = UIColor.myRedColor()
        level = "aHigh" // sort high priority at the top
    }
    
    func pushHomeButton() {
        homeButton.backgroundColor = UIColor.myBlueColor()
        workButton.backgroundColor = UIColor.myGrayColor()
        schoolButton.backgroundColor = UIColor.myGrayColor()
        category = "home"
        
    }
    
    func pushWorkButton() {
        homeButton.backgroundColor = UIColor.myGrayColor()
        workButton.backgroundColor = UIColor.myGreenColor()
        schoolButton.backgroundColor = UIColor.myGrayColor()
        category = "work"
    }
    
    func pushSchoolButton() {
        homeButton.backgroundColor = UIColor.myGrayColor()
        workButton.backgroundColor = UIColor.myGrayColor()
        schoolButton.backgroundColor = UIColor.myPurpleColor()
        category = "school"
    }
    
    @IBAction func lowButtonTapped(sender: AnyObject) {
        pushLowbutton()
        levelSelected = true
    }
    
    @IBAction func mediumButtonTapped(sender: AnyObject) {
        pushMediumButton()
        levelSelected = true
    }
    
    @IBAction func highButtonTapped(sender: AnyObject) {
        pushHighButton()
        levelSelected = true
    }
    
    @IBAction func homeButtonTapped(sender: AnyObject) {
        pushHomeButton()
        categorySelected = true
    }
    
    @IBAction func workButtonTapped(sender: AnyObject) {
        pushWorkButton()
        categorySelected = true
    }
    
    @IBAction func schoolButtonTapped(sender: AnyObject) {
        pushSchoolButton()
        categorySelected = true
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if !titleTextField.text!.isEmpty && levelSelected == true && categorySelected == true {
            updateReminder()
            navigationController?.popViewControllerAnimated(true)
        } else {
            let alert = UIAlertController(title: "Please provide a:", message: "-Title\n-Priority Level\n-Category", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}
