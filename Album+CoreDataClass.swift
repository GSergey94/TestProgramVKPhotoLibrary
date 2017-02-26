//
//  Album+CoreDataClass.swift
//  
//
//  Created by Владимир on 18.02.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Album)
public class Album: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName("Album"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
    }

}
