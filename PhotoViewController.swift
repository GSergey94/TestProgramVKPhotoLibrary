import UIKit
import SwiftyVK

class PhotoViewController: UIViewController {
    
    var namePhoto = ""
    @IBOutlet weak var photo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = UIImage(named: namePhoto)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func Sharing(_ sender: Any) {
        // Создание всплывающего снизу окошка
        let optionMenu = UIAlertController(title: nil, message: "Дейсвия", preferredStyle: .actionSheet)
        // Создание кнопки внутри этого окошка
        let SharingAction = UIAlertAction(title: "Поделиться", style: .cancel, handler: nil)
        // Подключение кнопки Закрытия всплывающего снизу окна
        optionMenu.addAction(SharingAction)
        // Отображение на экране
        self.present(optionMenu, animated: true, completion: nil)
      
    }
  
    
    
    
}
