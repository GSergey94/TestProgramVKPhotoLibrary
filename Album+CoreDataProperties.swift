//
//  Album+CoreDataProperties.swift
//  
//
//  Created by Владимир on 18.02.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album");
    }

    @NSManaged public var albumID: String?
    @NSManaged public var albumName: String?
    @NSManaged public var albumPhoto: String?
    @NSManaged public var userID: String?

}
