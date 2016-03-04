//
//  SchoolRemindersTableViewController.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class SchoolRemindersTableViewController: UITableViewController {

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
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ReminderController.sharedController.schoolReminders.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("schoolCell", forIndexPath: indexPath) as! SchoolButtonTableViewCell
        let reminder = ReminderController.sharedController.schoolReminders[indexPath.row]
        
        cell.updateWithReminder(reminder)
        cell.delegate = self
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let reminder = ReminderController.sharedController.schoolReminders[indexPath.row]
            ReminderController.sharedController.removeReminder(reminder)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSchoolDetail" {
            if let cell = sender as? SchoolButtonTableViewCell, indexPath = tableView.indexPathForCell(cell) {
                let reminderDetailViewController = segue.destinationViewController as! ReminderDetailViewController
                let reminder = ReminderController.sharedController.schoolReminders[indexPath.row]
                reminderDetailViewController.reminder = reminder
                reminderDetailViewController.levelSelected = true
                reminderDetailViewController.categorySelected = true
            }
        }
    }
}

extension SchoolRemindersTableViewController: SchoolButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: SchoolButtonTableViewCell) {
        let indexPath = tableView.indexPathForCell(sender)
        
        let reminder = ReminderController.sharedController.schoolReminders[indexPath!.row]
        reminder.isComplete = !reminder.isComplete!.boolValue
        ReminderController.sharedController.saveToPersistence()
        tableView.reloadData()
    }
}
