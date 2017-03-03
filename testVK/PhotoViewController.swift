import UIKit
import SwiftyVK

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var photo: UIImageView!
    
    
    var adressPhoto: String = ""
    var photoLONG: String = ""
    var photoLAT: String = ""
    var photoIdentifier: String = ""
    
    var namePhoto: String = ""
    var datePhoto: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.kf.setImage(with: URL(string: adressPhoto))
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func Sharing(_ sender: Any) {
        //To obtain date about  userID
        let defaults = UserDefaults.standard
        let user = defaults.string(forKey: "userID")
        
        // Create Alert for sharing photo to user wall
        let alert = UIAlertController(title: "Отправка фотографии", message: "Коментарий к фотографии:", preferredStyle: .alert)
        let CanselButton = UIAlertAction(title: "Отмена", style: .default) { (_) -> Void in }
        let SharingButton = UIAlertAction(title: "Поделиться записью", style: .default) { (_) -> Void in
            let textField = alert.textFields?[0]
            if let tf = textField {
                if let text = tf.text {
                    let photo = "photo\(user!)_\(self.photoIdentifier)>"
                    VK.API.Wall.post([VK.Arg.userId : user!, VK.Arg.message : text, VK.Arg.photo: self.adressPhoto, VK.Arg.attachment: photo]).send(
                        onSuccess: {response in print("Succsess upload photo to wall")},
                        onError: {error in
                            print("Error upload photo: \n \(error)")
                            let alertMessage = UIAlertController(title: "Не удалось отправить фотографию", message: "", preferredStyle: .alert)
                            let buttonOK = UIAlertAction(title: "ОК", style: .default) { (_) -> Void in
                                
                            }
                            alertMessage.addAction(buttonOK)
                            self.present(alertMessage, animated: true, completion: nil)
                        }
                        )
                    
                }
            }
        }
        
        alert.addTextField { (_) -> Void in
            
        }
        
        alert.addAction(SharingButton)
        alert.addAction(CanselButton)
        self.present(alert, animated: true, completion: nil)
      
        

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap"{
        let destinationController = segue.destination as! MapViewController
        destinationController.photoLAT = photoLAT
        destinationController.photoLONG = photoLONG
        destinationController.datePhoto = datePhoto
        destinationController.namePhoto = namePhoto
        }
    }
    
}
