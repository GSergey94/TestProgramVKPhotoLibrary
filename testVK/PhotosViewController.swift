import UIKit
import SwiftyVK
import CoreData
import Kingfisher

class PhotosViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableConfigurator = PhotosTableConfigurator()
    var albumID:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Declared controller in PhotosTableConfigurator  as this PhotosViewController
        self.tableConfigurator.controller = self
        
        self.tableView.delegate = self.tableConfigurator
        self.tableView.dataSource = self.tableConfigurator
        
        tableConfigurator.load(albumID: albumID)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    
    
   

    
}

