import UIKit
import SwiftyVK

class PhotosViewController: UITableViewController {
    
    
    var photosName = [String]()
    var datePhoto = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Задает колиество ячеек тайблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoTableViewCell
        cell.imagePhoto?.image = UIImage(named: "VK.png")
        cell.namePhoto?.text = photosName[indexPath.row]
        cell.datePhoto?.text = datePhoto[indexPath.row]
        cell.imagePhoto.layer.cornerRadius = 30.0
        cell.imagePhoto.clipsToBounds = true
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto"{
            if tableView.indexPathForSelectedRow != nil {
                let destinationController = segue.destination as! PhotoViewController
                destinationController.namePhoto = "VK.png"
             
            }
        }
    }
    
}

