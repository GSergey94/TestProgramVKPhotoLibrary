import UIKit
import SwiftyVK
import CoreData
import Kingfisher

class PhotosViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var albumID = ""
    var Photo = [Structurs.photo()]
    
    let table = PhotosTableConfigurator()
    
    
    var imagesDirectoryPath:String!
    var images: [UIImage]!
    var titles:[String]!
    var markerFirstLoadController = false
    //---------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self.table
        self.tableView.dataSource = self.table
        table.load(albumID: albumID)
        
            }
    //---------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //---------------------------------------------------------------------------------------
   
    
    /*
    //---------------------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto"{
             if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! PhotoViewController
                destinationController.adressPhoto = Photo[indexPath.row].photoReference
                destinationController.photoLONG = Photo[indexPath.row].photoLocLONG
                destinationController.photoLAT = Photo[indexPath.row].photoLocLAT
                destinationController.photoIdentifier = Photo[indexPath.row].idPhoto
                destinationController.namePhoto = Photo[indexPath.row].photoName
                destinationController.datePhoto = Photo[indexPath.row].photoDate
                
            }
        }
    }
    //---------------------------------------------------------------------------------------
    */
    
    
    
   

    
}

