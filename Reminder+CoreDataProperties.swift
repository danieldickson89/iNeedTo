//
//  Reminder+CoreDataProperties.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Reminder {

    @NSManaged var category: String?
    @NSManaged var level: String?
    @NSManaged var text: String?
    @NSManaged var title: String?
    @NSManaged var isComplete: NSNumber?

}
