//
//  CategoryController.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 4/7/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import CoreData

class CategoryController {
    
    private let kCategories = "categories"
    
    static let sharedController = CategoryController()
    
    private func categoryWithPredicate(predicate: NSPredicate?) -> [Category]? {
        let request = NSFetchRequest(entityName: "Category")
        request.predicate = predicate
        
            return try? Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as? [Category] ?? []
        
    }
    
    var categories: [Category] {
        return categoryWithPredicate(nil) ?? []
    }
    
    func addCategory(category: Category) {
        
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}