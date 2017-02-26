import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController{
    
   
    var namePhoto = ""
    var datePhoto = ""
    var photoLONG = ""
    var photoLAT = ""
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    let LONG = Double(photoLONG)
    let LAT = Double(photoLAT)
        
        if LONG != nil {
            let location = CLLocationCoordinate2DMake(LAT!, LONG!)
            let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Фото: \(namePhoto)"
        annotation.subtitle = datePhoto
        
        let span = MKCoordinateSpanMake(0.2,0.2)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        }
        else{
            let alertMessage = UIAlertController(title: "Геолокация недоступна", message: "У данной фотографии отсутсвует информация о местоположении", preferredStyle: .alert)
            let Login = UIAlertAction(title: "ОК", style: .default) { (_) -> Void in
                
            }
            alertMessage.addAction(Login)
            self.present(alertMessage, animated: true, completion: nil)
            

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    
    
    
    
}
