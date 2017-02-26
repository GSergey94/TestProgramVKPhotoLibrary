
import UIKit
import SwiftyVK
import CoreData
import Kingfisher


class AlbumViewController: UITableViewController,  UINavigationControllerDelegate{
    
    
   
    var albumID = [String]()
    var Albums = [Structurs.album()]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Albums.removeAll()
        let CoreData = CoreDataManager()
        Albums = CoreData.DownloadInformationAboutAlbum()
        
        
    }
    //---------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///---------------------------------------------------------------------------------------
    /*
    func DownloadInformationAboutAlbum(){
        Albums.removeAll()
        //To obtain date about  userID
        let defaults = UserDefaults.standard
        let user = defaults.string(forKey: "userID")
        
        // To obtain data about AlbumName and album photo URL
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        let sortDescriptorUserID = NSSortDescriptor(key: "userID", ascending: true)
        let resultPredicate = NSPredicate(format: "userID = %@", user!)
        fetchRequest.sortDescriptors = [sortDescriptorUserID]
        fetchRequest.predicate = resultPredicate
        do {
            let results = try CoreDataManager.instance.managedObjectContext.fetch(fetchRequest)
            for result in results as! [Album] {
                Albums.append(Structurs.album.init(userID: user!,
                                                   albumID: result.albumID!,
                                                   albumName: result.albumName!,
                                                   albumPhoto: result.albumPhoto!
                ))
                
            }
        } catch {
            print(error)
        }
    }
 */

//---------------------------------------------------------------------------------------
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//---------------------------------------------------------------------------------------
    //Задает колиество ячеек тайблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Albums.count
    }
    

//---------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
       cell.imageAlbum.kf.setImage(with: URL(string: Albums[indexPath.row].albumPhoto))
       cell.nameAlbum?.text = Albums[indexPath.row].albumName
       cell.imageAlbum.layer.cornerRadius = 30.0
       cell.imageAlbum.clipsToBounds = true
 
       return cell
    }
    
 //---------------------------------------------------------------------------------------
    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum"{
            if let indexPath = tableView.indexPathForSelectedRow {
             let destinationController = segue.destination as! PhotosViewController
             destinationController.albumID = Albums[indexPath.row].albumID
            }
        }
    }
    
//---------------------------------------------------------------------------------------
    // Button LOG OUT
    @IBAction func LogOut(_ sender: Any) {
       
        
        VK.logOut()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        self.present(vc!, animated: true, completion: nil)
        
        
    }
    
    
    
    

}

