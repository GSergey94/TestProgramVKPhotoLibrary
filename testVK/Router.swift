
struct Router{
    
    
    func goToPhotoViewController(photo: photo,controller: PhotosViewController){
        let view: PhotoViewController = controller.storyboard?.instantiateViewController(withIdentifier: "photoIdentity") as! PhotoViewController
        view.photo = photo
        controller.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func goToPhotosViewController(albumID:String,controller: AlbumViewController){
        let view: PhotosViewController = controller.storyboard?.instantiateViewController(withIdentifier: "photosIdentity") as! PhotosViewController
        view.albumID = albumID
        controller.navigationController?.pushViewController(view, animated: true)
    }
    
}
