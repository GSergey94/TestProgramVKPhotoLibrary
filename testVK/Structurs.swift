struct album{
        var userID:String
        var albumID:String
        var albumName:String
        var albumPhoto:String
        var dateUpdate:String

    }

struct photo{
        var idPhoto:String
        var photoReference:String
        var miniPhotoReference:String
        var photoName:String
        var photoDate:String
        var photoLocLONG:String
        var photoLocLAT:String
    }
    
struct downloadPhoto{
        var url:String
        var id:String
        var marker:Bool
        var idAlbum:String
        
    }

