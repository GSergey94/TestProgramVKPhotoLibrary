import Foundation
import UIKit

class AlbumTableConfigurator: NSObject, UITableViewDelegate, UITableViewDataSource{
    
    weak var controller: AlbumViewController!
    
    var Albums = [album()]
    
    func load(){
        Albums.removeAll()
        let CoreData = CoreDataManager()
        Albums = CoreData.DownloadInformationAboutAlbum()
        
    }
        
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Albums.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.configure(info: Albums[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        Router().goToPhotosViewController(albumID: Albums[indexPath.row].albumID, controller: controller)
    }
  
}
