import Foundation
import UIKit

class PhotosTableConfigurator: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var Photo = [Structurs.photo()]
    
    func load(albumID: String){
        Photo.removeAll()
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
        print("User selected table row \(indexPath.row) and item ")
        //let destinationController =  PhotosViewController()
        //destinationController.albumID = Albums[indexPath.row].albumID
    }
    
}
