import SwiftyVK
import CoreData



// ---- Хранение картинок в памяти а не в Core Data - [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image.png"]] Objective - C


class VKDelegateClass: VKDelegate {
    let appID = "5851140"
    let scope: Set<VK.Scope> = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    let view = LoginViewController()
    
    
    init() {
        VK.config.logToConsole = true
        VK.configure(withAppId: appID, delegate: self)
        
    }
    
    //Функция вызывается когда нужны полномочия авторизации
    func vkWillAuthorize() -> Set<VK.Scope> {
        print("Запрашиваются полномочия для авторизации() \n")
        return scope
    }
    
    
    //Вызывается когда пользователь входит в систему -- Тут можно начинать отправлять запросы к API
    func vkDidAuthorizeWith(parameters: Dictionary<String, String>) {
        print("Пользователь вошел в систему\n")
        //Сохранение UserID
        let userID = parameters["user_id"]
        
        //Save userID
        let defaults = UserDefaults.standard
        defaults.setValue(userID, forKey: "userID")
        defaults.synchronize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "TestVkDidAuthorize"), object: nil)
        
        //Получение данных userID
        
        //let user = defaults.string(forKey: userID!)
        
       // if userID == user { print("Для данного пользователя уже получены данные по альбомам "); return }
        
        
        var Albums = [Structurs.album()]
        var AlbumsFromCoreData = [Structurs.album()]
        Albums.removeAll()
        AlbumsFromCoreData.removeAll()
        
        let CoreData = CoreDataManager()
       // AlbumsFromCoreData = CoreData.DownloadInformationAboutAlbum()
        //print("Количество альбомов закаченых из корДаты: \(AlbumsFromCoreData.count)")
        
        // Get information about alboms
        VK.API.Photos.getAlbums([VK.Arg.needCovers: userID!]).send(
            onSuccess: {
                response in
                
                // if Download information about albums succsessfull delete old albums from CoreData
                AlbumsFromCoreData = CoreData.DownloadInformationAboutAlbum(delete: true)
                
                
                let context = CoreDataManager.instance.managedObjectContext
                // Entity Album
                let entityDescriptionAlbum = NSEntityDescription.entity(forEntityName: "Album", in: context)
                // Entity Photo
                let entityDescriptionPhoto = NSEntityDescription.entity(forEntityName: "Photo", in: context)
               
                for index in 0 ..< response["count"].intValue {
                    
                        // Create new object - Album
                        let AlbumObject = Album(entity: entityDescriptionAlbum!, insertInto: context)
                    
                        Albums.append(Structurs.album.init(
                                      userID: userID!
                                    , albumID: response["items",index,"id"].stringValue
                                    , albumName: response["items",index,"title"].stringValue
                                    , albumPhoto: response["items",index,"thumb_src"].stringValue
                        ))
                    
                    
                        // Save Parament album
                        AlbumObject.userID = userID
                        AlbumObject.albumID = Albums[index].albumID
                        AlbumObject.albumName = Albums[index].albumName
                        AlbumObject.albumPhoto = Albums[index].albumPhoto
                        
                        // Save Album
                        do { try context.save() } catch { return }
                    
                   
                    //Get information about photo
                    VK.API.Photos.get([VK.Arg.albumId: Albums[index].albumID]).send(
                        onSuccess: {
                            response in
                           
                           
                            // Value for converter photo date
                            let dayTimePeriodFormatter = DateFormatter()
                            dayTimePeriodFormatter.dateFormat = "dd MMM YYYY"
                            
                            for i in 0 ..< response["count"].intValue {
                                
                                    let PhotoObject = Photo(entity: entityDescriptionPhoto!, insertInto: context)
                                
                                    // Get Date Photo
                                    let date = NSDate(timeIntervalSince1970: (response["items",i,"date"].doubleValue))
                                    let dateString = dayTimePeriodFormatter.string(from: date as Date)
                                
                                    PhotoObject.idAlbum = Albums[index].albumID
                                    PhotoObject.idPhoto = response["items",i,"id"].stringValue
                                    PhotoObject.photoReference = response["items",i,"photo_604"].stringValue
                                    PhotoObject.miniPhotoReference = response["items",i,"photo_130"].stringValue
                                    PhotoObject.photoName = response["items",i,"text"].stringValue
                                    PhotoObject.photoDate = dateString
                                    PhotoObject.photoLocLONG = response["items",i,"long"].stringValue
                                    PhotoObject.photoLocLAT = response["items",i,"lat"].stringValue
                                
                                do { try context.save() } catch { return }
                             }
                            
                    },
                        onError: {error in print(error)}
                    )
                    
                 
                
                }
                
                
                
                 //Save information about user data:
                 let defaults = UserDefaults.standard
                 defaults.setValue(userID, forKey: userID!)
                 defaults.synchronize()
                 NotificationCenter.default.post(name: Notification.Name(rawValue: "TestVkDidAuthorize"), object: nil)
            
                
                
        },
            onError: {error in print(error)}
        )

        
        
        
    }
    
    // Вызванный, когда SwiftyVK не может авторизоваться. Позволять приложению знать, что что-то пошло не так, как надо.
    func vkAutorizationFailedWith(error: AuthError) {
        print("Autorization failed with error: \n\(error)")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "TestVkDidNotAuthorize"), object: nil)
    }
    
    
    // Вызывается когда пользователь разлогинился
    func vkDidUnauthorize() {
        print("Пользователь вышел со своей учетной записи\n")

    }
    
    
    //Ключ теперь находится в связке ключей
    //Вызванный, когда SwiftyVK должны знать, где ключ расположен.
    func vkShouldUseTokenPath() -> String? {
        print("Ключ находится в связке ключей?\n")
        return nil
        
    }
    
    
    // Вызывается когда надо вывести View от SwiftyVK
    func vkWillPresentView() -> UIViewController {
        print("Вывод WebView экрана контроллера\n")
        return UIApplication.shared.delegate!.window!!.rootViewController!
        
    }
    
   
    
    
}
