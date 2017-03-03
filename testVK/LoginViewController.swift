import UIKit
import SwiftyVK
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var albumButton: UIButton!
    let state = 2 // State - LogIn
    
    
    override func viewWillAppear(_ animated: Bool) { //  animation button
        albumButton.center.y += view.bounds.height
        UIView.animate(withDuration: 1.5, animations: {
            self.albumButton.center.y -= self.view.bounds.height
        })
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func GoToAlbumViewController(_ sender: Any) {
        //IF login, then Go to Albums
        if VK.state.hashValue == state {
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlbumView") as! UINavigationController
            self.present(vc, animated: true, completion: nil)
            
        }
        // else go to Login view
        else
        {
            
                let alertMessage = UIAlertController(title: "Просмотр не доступен", message: "Для просмотра фотоальбомов войдите в свою учетную запись", preferredStyle: .alert)
                let Login = UIAlertAction(title: "Войти", style: .default) { (_) -> Void in
                VK.logIn()
                }
                alertMessage.addAction(Login)
                self.present(alertMessage, animated: true, completion: nil)
            
            
        }
        
    }
   
    
}




