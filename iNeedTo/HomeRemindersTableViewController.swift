//
//  HomeRemindersTableViewController.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class HomeRemindersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Changed from viewDidAppear
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func icons8ButtonTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "icons created by:", message: String(NSURL(string: "https://icons8.com/")!), preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Take me to their website", style: .Default, handler: { (iconsLink) -> Void in
            let icons8 = NSURL(string: "https://icons8.com")
            UIApplication.sharedApplication().openURL(icons8!)
            
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ReminderController.sharedController.homeReminders.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath) as! HomeButtonTableViewCell
        let reminder = ReminderController.sharedController.homeReminders[indexPath.row]
        
        cell.updateWithReminder(reminder)
        cell.delegate = self
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let reminder = ReminderController.sharedController.homeReminders[indexPath.row]
            ReminderController.sharedController.removeReminder(reminder)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHomeDetail" {
            if let cell = sender as? HomeButtonTableViewCell, indexPath = tableView.indexPathForCell(cell) {
                let reminderDetailViewController = segue.destinationViewController as! ReminderDetailViewController
                let reminder = ReminderController.sharedController.homeReminders[indexPath.row]
                reminderDetailViewController.reminder = reminder
                reminderDetailViewController.levelSelected = true
                reminderDetailViewController.categorySelected = true
            }
        }
    }
}

extension HomeRemindersTableViewController: HomeButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: HomeButtonTableViewCell) {
        let indexPath = tableView.indexPathForCell(sender)
        
        let reminder = ReminderController.sharedController.homeReminders[indexPath!.row]
        reminder.isComplete = !reminder.isComplete!.boolValue
        ReminderController.sharedController.saveToPersistence()
        tableView.reloadData()
    }
}
