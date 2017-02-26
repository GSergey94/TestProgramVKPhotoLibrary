//
//  Album.swift
//  testVK
//
//  Created by Владимир on 18.02.17.
//  Copyright © 2017 Gorelovskiy. All rights reserved.
//

import Foundation
import CoreData

class Structurs {
    
    struct album{
        var userID = ""
        var albumID = ""
        var albumName = ""
        var albumPhoto = ""

    }
    
    struct photo{
        var idPhoto = ""
        var photoReference = ""
        var miniPhotoReference = ""
        var photoName = ""
        var photoDate = ""
        var photoLocLONG = ""
        var photoLocLAT = ""
    }
    
    struct downloadPhoto{
        var url = ""
        var id = ""
        var marker = false
        var idAlbum = ""
        
    }
    
    
}
