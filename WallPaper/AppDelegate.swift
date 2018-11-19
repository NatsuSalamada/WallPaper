 //
 //  AppDelegate.swift
 //  WallPaper
 //
 //  Created by Bé Nhện Của Bé Thảo on 04/06/2018.
 //  Copyright © 2018 NatsuSalamada. All rights reserved.
 //
 
 import UIKit
 import CoreData
 
 @UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var share = {
        return UIApplication.shared.delegate as! AppDelegate
    }()
    
    
    var reachability: Reachability! = {
        guard let reachability = Reachability(hostname: "google.com") else {
            return nil
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: .reachabilityChanged, object: reachability)
        return reachability
    }()
    
    @objc func reachabilityChanged() {
        switch reachability.connection {
        case .none:
            showAlertToOpenSetting(title: "Cellular Data is Turned Off", message: "Turn on cellular data and allow app to access or use Wi-Fi to access data.")
        case .wifi:
            break
        case .cellular:
            break
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        
        
        RE.sharedInstanceRE.requestLoadAd()
        
        if UserDefaults.standard.object(forKey: "SecondRunApp") == nil {
            UserDefaults.standard.set(0, forKey: "SecondRunApp")
            UserDefaultBegan()
            let f = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FristNavigation") as! FristNavigation
            window?.rootViewController = f
            window?.makeKeyAndVisible()
            UserDefaults.standard.set(5, forKey: "Show")
            UserDefaults.standard.set(5, forKey: "Ran")
        }else{
            let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondNavigation") as! SecondNavigation
            window?.rootViewController = s
            window?.makeKeyAndVisible()
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        reachabilityChanged()
        if UserDefaults.standard.integer(forKey: "SecondRunApp") == 2{
            GoogleAdMob.sharedInstance.showInterstitial()
            
        }else{
            
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "SecondRunApp") + 1, forKey: "SecondRunApp")
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        AppDelegate.saveContext()
<<<<<<< HEAD
    }
    
    static var context: NSManagedObjectContext {
        return AppDelegate.persistentContainer.viewContext
    }
=======
    }
    
    static var context: NSManagedObjectContext {
        return AppDelegate.persistentContainer.viewContext
    }
    
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        
        
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
                print("save successful")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    static func deleteContext(object:NSManagedObject){
        
        
        
        context.delete(object)
        print("delete successful")
        do {
            try context.save()
            print("save successful")
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
<<<<<<< HEAD
    
 }
 
=======

}

>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
