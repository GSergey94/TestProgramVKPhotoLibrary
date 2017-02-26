//
//  Photo+CoreDataClass.swift
//  
//
//  Created by Владимир on 21.02.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Photo)
public class Photo: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName("Photo"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
    }
}
