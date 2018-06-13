//
//  AppDelegate.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/10.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit
import CoreData
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var commonvar = CommonVar()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "personal_info")
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

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

class CommonVar{
    var section:Section?

    func setdata(sections: [String], contents: [String]){
        self.section = Section()
        // set section infomation
        for line in sections{
            var values = line.components(separatedBy: ",")

            self.section!.appendsection(title: values[0], contents: Array(values[1..<values.count]))
        }
        // set content information
        for line in contents{
            var values = line.components(separatedBy: ",")
            self.section!.appenddata(title: values[0], contentData: Array(values[1..<values.count]))
        }
    }

}

class Section{
    var titles = [String]()
    var contents = [Content]()

    func appendsection (title: String, contents: [String]) -> Bool{
        if (self.titles.index(of: title) == nil){
            self.titles.append(title)
            self.contents.append(Content(contentNames: contents))
            return true
        }
        else{
            return false
        }
    }

    func appenddata(title: String, contentData: [String]) -> Bool{
        if let index = self.titles.index(of: title){
            self.contents[index].setContentData(title: contentData[0], contentData: Array(contentData[1..<contentData.count]))
            return true
        }
        else{
            return false
        }
    }
}

class Content{
    var names = [String]()
    var contents_name = [String]()
    var contents_data = [[String]]()

    // for contents name
    init(contentNames: [String]){
        for name in contentNames{
            self.contents_name.append(name)
        }
    }
    // for actual data
    func setContentData(title: String,contentData: [String]){
        self.names.append(title)
        self.contents_data.append(contentData)
    }

    func printforcheck(){
        var tmp = ""
        for contentname in contents_name{
            tmp += contentname + " "
        }
        print(tmp)

        for contents in contents_data{
            tmp = ""
            for content in contents{
                tmp += content + " "
            }
            print(tmp)
        }
    }
}


