//
//  Photo+CoreDataProperties.swift
//  
//
//  Created by Владимир on 21.02.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo");
    }

    @NSManaged public var photoReference: String?
    @NSManaged public var miniPhotoReference: String?
    @NSManaged public var photoName: String?
    @NSManaged public var photoDate: String?
    @NSManaged public var photoLocLONG: String?
    @NSManaged public var photoLocLAT: String?
    @NSManaged public var idAlbum: String?
    @NSManaged public var idPhoto: String?

}
