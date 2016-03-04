//
//  ReminderController.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import CoreData

class ReminderController {
    
    private let reminderKey = "reminder"
    static let sharedController = ReminderController()
    
    // Create arrays for each category (and one for all combined)
    
    var allReminders: [Reminder] {
        let request = NSFetchRequest(entityName: "Reminder")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            let array = try moc.executeFetchRequest(request) as! [Reminder]
            
            // Sort the items by priority level, and  categorically/alphabetically within each priority level
            let newArray = array.sort() {
                if $0.level == $1.level {
                    return $0.category == $1.category ? ($0.title!.lowercaseString < $1.title!.lowercaseString) : ($0.category < $1.category)
                } else {
                    return $0.level < $1.level
                }
            }
            
            return newArray
            
        } catch {
            return []
        }
    }
    
    var homeReminders: [Reminder] {
        let request = NSFetchRequest(entityName: "Reminder")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            let array = try moc.executeFetchRequest(request) as! [Reminder]
            let newArray = array.filter() { $0.category == "home" }
            return newArray.sort() { $0.level == $1.level ? ($0.title!.lowercaseString < $1.title!.lowercaseString) : ($0.level < $1.level) }
        } catch {
            return []
        }
    }
    
    var schoolReminders: [Reminder] {
        let request = NSFetchRequest(entityName: "Reminder")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            let array = try moc.executeFetchRequest(request) as! [Reminder]
            let newArray = array.filter() { $0.category == "school" }
            return newArray.sort() { $0.level == $1.level ? ($0.title!.lowercaseString < $1.title!.lowercaseString) : ($0.level < $1.level) }
        } catch {
            return []
        }
    }
    
    var workReminders: [Reminder] {
        let request = NSFetchRequest(entityName: "Reminder")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            let array = try moc.executeFetchRequest(request) as! [Reminder]
            let newArray = array.filter() { $0.category == "work" }
            return newArray.sort() { $0.level == $1.level ? ($0.title!.lowercaseString < $1.title!.lowercaseString) : ($0.level < $1.level) }
        } catch {
            return []
        }
    }
    
    func addReminder(reminder: Reminder) {
        
        self.saveToPersistence()
    }
    
    func removeReminder(reminder: Reminder) -> () {
        if let moc = reminder.managedObjectContext {
            moc.deleteObject(reminder)
        }
        saveToPersistence()
    }
    
    // Save Core Data
    func saveToPersistence() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
}
