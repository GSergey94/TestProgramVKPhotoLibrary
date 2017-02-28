
import UIKit
import SwiftyVK
import CoreData
import Kingfisher


class AlbumViewController: UIViewController,  UINavigationControllerDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
   
    var albumID = [String]()
    let table = AlbumTableConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self.table
        self.tableView.dataSource = self.table
        table.load()

     }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // Button LOG OUT
    @IBAction func LogOut(_ sender: Any) {
       
        
        VK.logOut()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        self.present(vc!, animated: true, completion: nil)
        
        
    }
    
    
    
    

}

