import UIKit
import SwiftyVK

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    var photo:photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.kf.setImage(with: URL(string: photo.photoReference))
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    // Func sharing photo on the wall VK
    @IBAction func Sharing(_ sender: Any) {
        //To obtain date about  userID
        let defaults = UserDefaults.standard
        let user = defaults.string(forKey: "userID")
        
        // Create Alert 
        let alert = UIAlertController(title: "Отправка фотографии", message: "Коментарий к фотографии:", preferredStyle: .alert)
        let CanselButton = UIAlertAction(title: "Отмена", style: .default) { (_) -> Void in }
        let SharingButton = UIAlertAction(title: "Поделиться записью", style: .default) { (_) -> Void in
            let textField = alert.textFields?[0]
            if let text = textField?.text {
                
                let photoAttachment = "photo\(user!)_\(self.photo.idPhoto)>"
                    VK.API.Wall.post([VK.Arg.userId : user!, VK.Arg.message : text, VK.Arg.photo: self.photo.photoReference, VK.Arg.attachment: photoAttachment]).send(
                        onSuccess: {response in },
                        onError: {error in
                            let alertMessage = UIAlertController(title: "Не удалось отправить фотографию", message: "", preferredStyle: .alert)
                            let buttonOK = UIAlertAction(title: "ОК", style: .default) { (_) -> Void in 
                            }
                            alertMessage.addAction(buttonOK)
                            self.present(alertMessage, animated: true, completion: nil)
                        }
                        )
                    
                
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
            destinationController.photo = photo
        }
    }
    
}
