//
//  Reminder.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import CoreData


class Reminder: NSManagedObject {

    convenience init(title: String, text: String?, category: String, level: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Reminder", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.title = title
        self.text = text
        self.category = category
        self.level = level
        self.isComplete = false
    }
}

func == (lhs: Reminder, rhs: Reminder) -> Bool {
    return lhs.title == rhs.title
}

func > (lhs: Reminder, rhs: Reminder) -> Bool {
    return lhs.title < rhs.title
}
