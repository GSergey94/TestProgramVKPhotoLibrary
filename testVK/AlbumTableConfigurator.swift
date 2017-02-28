import Foundation
import UIKit

class AlbumTableConfigurator: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var Albums = [Structurs.album()]
    
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
        print("User selected table row \(indexPath.row) and item ")
        let destinationController =  PhotosViewController()
        destinationController.albumID = Albums[indexPath.row].albumID
    }
    
}
