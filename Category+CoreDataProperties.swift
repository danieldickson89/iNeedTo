//
//  Category+CoreDataProperties.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 4/7/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Category {

    @NSManaged var iconName: String?
    @NSManaged var reminders: Reminder?

}
