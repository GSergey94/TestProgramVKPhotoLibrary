
import UIKit
import SwiftyVK
import CoreData
import Kingfisher


class AlbumViewController: UIViewController,  UINavigationControllerDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
   
    var albumID = [String]()
    let tableConfigurator = AlbumTableConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Declared controller in AlbumTableConfigurator  as this AlbumViewController
        self.tableConfigurator.controller = self
        
        self.tableView.delegate = self.tableConfigurator
        self.tableView.dataSource = self.tableConfigurator
        tableConfigurator.load()

     }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    @IBAction func LogOut(_ sender: Any) {
        VK.logOut()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        self.present(vc!, animated: true, completion: nil)
        

    }
   
    
    
    
    

}

