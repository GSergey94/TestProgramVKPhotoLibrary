import UIKit
import SwiftyVK
import CoreData

class StartViewController: UIViewController {
    
    
    @IBOutlet weak var albumButton: UIButton!
    @IBOutlet weak var logButton: UIButton!
    let state = 2 // State - LogIn
    
    let vkDelegateClass = VKDelegateClass()
    
    
    override func viewWillAppear(_ animated: Bool) { //  animation button
        logButton.center.y += view.bounds.height
        albumButton.center.y += view.bounds.height

        UIView.animate(withDuration: 1.5, animations: {
            self.logButton.center.y -= self.view.bounds.height
            self.albumButton.center.y -= self.view.bounds.height
        })
        
        
        
        
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton()
        
        //Generate text albumButton
        if VK.state.hashValue == state {
            Router().goToAlbumsViewController(controller: self)
        }
        
     
    }
    
    
    
   
    @IBAction func logOutButton(_ sender: Any) {
       
        if VK.state.hashValue == state {
            VK.logOut()
            
            
        }
        else{
            VK.logIn()
            
                    }
 
    }
    
    
    func refreshButton(){
        if VK.state.hashValue == state {
            albumButton.isHidden = false;
            logButton.setTitle("Выйти", for: .normal)
        }
        else{
            albumButton.isHidden = true;
            logButton.setTitle("Войти", for: .normal)
        }
        
    }
    
}




