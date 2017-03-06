import Foundation
import UIKit

class PhotosTableConfigurator: NSObject, UITableViewDelegate, UITableViewDataSource{
    
    
    weak var controller:PhotosViewController!
    var Photo:[photo] = []
    
    func load(albumID: String){
        let CoreData = CoreDataManager()
        Photo = CoreData.DownloadInformationAboutPhotos(albumID: albumID)
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Photo.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoTableViewCell
        cell.configure(info: Photo[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        Router().goToPhotoViewController(photo: Photo[indexPath.row], controller: controller)
       
    }
    
}
