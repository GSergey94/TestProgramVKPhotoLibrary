
import UIKit
import SwiftyVK

class AlbumViewController: UITableViewController, UINavigationControllerDelegate {
    
    
    var albumName = [String]()
    var albumPhoto = [Int]()
    
    var datePhoto = [String]()
    var photosName = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Получение данных userID
        let defaults = UserDefaults.standard
        let userID = defaults.string(forKey: "userID")
        
       
        VK.API.Photos.getAlbums([VK.Arg.userId: userID! ]).send(
            onSuccess: {
                response in
                for index in 0 ..< response.count {
                    self.albumName.append("")
                    self.albumPhoto.append(0)
                    self.albumName[index] = response["items",index,"title"].stringValue
                    self.albumPhoto[index] = response["items",index,"thumb_id"].intValue
                
                }
                print("Количество ячеек - \(self.albumName.count)  значения \(self.albumName)")
                self.tableView.reloadData()
               
        },
            onError: {error in print(error)}
        )
        
    
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
        return self.albumName.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.imageAlbum?.image = UIImage(named: "VK.png")
        cell.nameAlbum?.text = albumName[indexPath.row]
        
        cell.imageAlbum.layer.cornerRadius = 30.0
        cell.imageAlbum.clipsToBounds = true
 
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum"{
            if let indexPath = tableView.indexPathForSelectedRow {
             let destinationController = segue.destination as! PhotosViewController
             destinationController.datePhoto.append(datePhoto[indexPath.row])
             destinationController.photosName.append(photosName[indexPath.row])
            }
        }
    }
    
    @IBAction func LogOut(_ sender: Any) {
        VK.logOut()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        self.present(vc!, animated: true, completion: nil)
       
        
    }
    
    
    
}

