import SwiftyVK

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
        //Сохранение данных:
        let defaults = UserDefaults.standard
        defaults.setValue(userID, forKey: "userID")
        defaults.synchronize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "TestVkDidAuthorize"), object: nil)
        
        
        
        
        
        
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
