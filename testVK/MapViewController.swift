import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController{
    
   
    @IBOutlet weak var mapView: MKMapView!
    var photo:photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationLONG = Double(photo.photoLocLONG)
        let locationLAT = Double(photo.photoLocLAT)
        
        if locationLONG != nil {
            let location = CLLocationCoordinate2DMake(locationLAT!, locationLONG!)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Фото: \(photo.photoName)"
            annotation.subtitle = photo.photoDate
        
            let span = MKCoordinateSpanMake(0.2,0.2)
            let region = MKCoordinateRegion(center: location, span: span)
        
            mapView.setRegion(region, animated: true)
            mapView.addAnnotation(annotation)
        }
        else{
            let alertMessage = UIAlertController(
                                                title: "Геолокация недоступна"
                                                ,message: "У данной фотографии отсутсвует информация о местоположении"
                                                , preferredStyle: .alert)
            
            let Login = UIAlertAction(title: "ОК", style: .default) { (_) -> Void in }
            alertMessage.addAction(Login)
            self.present(alertMessage, animated: true, completion: nil)
            

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    
    
    
    
}
