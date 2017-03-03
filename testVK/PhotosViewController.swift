import UIKit
import SwiftyVK
import CoreData
import Kingfisher

class PhotosViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var albumID: String = ""
    
    
    let tableConfigurator = PhotosTableConfigurator()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.delegate = self.tableConfigurator
        self.tableView.dataSource = self.tableConfigurator
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func load(){
         tableConfigurator.load(albumID: self.albumID)
    }
    
    
    
    
    
   

    
}

