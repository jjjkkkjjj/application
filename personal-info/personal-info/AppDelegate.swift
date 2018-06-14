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
    var file:File

    init(){
        //read csv, then set data for Section and Content class
        self.file = File()
        self.file.set()
    }
}

class Section{
    var title: String
    var content: [String]

    init(title: String, content: [String]){
        self.title = title
        self.content = content
    }
    /*
    func appendSection (title: String, contents: [String], initcall: Bool) -> Bool{
        if (self.titles.index(of: title) == nil){
            self.titles.append(title)
            self.contents.append(Content(contentNames: contents))

            if(!initcall){
                //call writecsv method of super class
            }

            return true
        }
        else{
            return false
        }
    }

    func appendData(title: String, contentData: [String], initcall: Bool) -> Bool{
        if let index = self.titles.index(of: title){
            self.contents[index].setContentData(title: contentData[0], contentData: Array(contentData[1..<contentData.count]))

            if(!initcall){
                //call writecsv method of super class
            }

            return true
        }
        else{
            return false
        }
    }*/

    func removeSection(){

    }
}

class Item: Section{
    //
    var item = [[String]]()

    override init(title: String, content: [String]){
        super.init(title: title, content: content)
    }

    func titleName() -> [String]{
        var titleNames = [String]()
        for item in self.item{
            titleNames.append(item[0])
        }
        return titleNames
    }

    func appendItem(contentData: [String]){
        self.item.append(contentData)
    }

    func removeData(sectionRow: Int){
        self.item.remove(at: sectionRow)
    }
}

class File{
    var sectionInfo = [String]()
    var contentData = [[String]]()
    var contents = [Item]()

    //var buttonSave: Bool = false

    func set(){
        //self.initCsv() // uncoment when you'd like to rewrite csv
        if (!self.initReadCsv()){
            self.sectionInfo = [String]()
            self.contentData = [[String]]()
            self.contents = [Item]()

            self.initCsv()
            self.initReadCsv()
        }
    }

    func initCsv(){
        do {
            if let fileurl = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/SectionInfo.csv")

                //CSVファイルのデータを取得する。
                let text = "Shopping,name,url,account,password\nAPP,name,password\n"
                try text.write(to: csvPath, atomically: true, encoding: String.Encoding.utf8)
            }
            if let fileurl = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/ContentData.csv")

                //CSVファイルのデータを取得する。
                let text = "Shopping,amazon,https://www.amazon.co.jp,aaa,1234\nAPP,round1,1111\nShopping,hoge,www.hoge.co.jp,aaa,i234"
                try text.write(to: csvPath, atomically: true, encoding: String.Encoding.utf8)
            }
        }
        catch {

        }
    }

    func removeData(section: Int, sectionRow: Int){
        self.contentData[section].remove(at: sectionRow)
        self.contents[section].removeData(sectionRow: sectionRow)
        self.rewriteNowData(sectionInfo: false, contentData: true)
    }

    func initReadCsv() -> Bool{
        do {
            //CSVファイルのパスを取得する。
            if let fileurl = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/SectionInfo.csv")
                //CSVファイルのデータを取得する。
                let csvData = try String(contentsOf: csvPath, encoding:String.Encoding.utf8)

                //改行区切りでデータを分割して配列に格納する。

                csvData.enumerateLines{ (line, stop) -> () in
                    var values = line.components(separatedBy: ",")

                    var item = Item(title: values[0], content: Array(values[1..<values.count]))
                    self.contents.append(item)
                    self.sectionInfo.append(line)
                    self.contentData.append([])
                }
            }
            else{
                return false
            }

            if let fileurl = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/ContentData.csv")
                //CSVファイルのデータを取得する。
                let csvData = try String(contentsOf: csvPath, encoding:String.Encoding.utf8)

                //改行区切りでデータを分割して配列に格納する。

                csvData.enumerateLines{ (line, stop) -> () in
                    var values = line.components(separatedBy: ",")
                    let titleIndex = self.sectionTitleIndex(title: values[0])
                    if (titleIndex != -1){
                        self.contents[titleIndex].appendItem(contentData: Array(values[1..<values.count]))
                        self.contentData[titleIndex].append(line)
                    }
                }
                return true
            }
            else{
                return false
            }
        }
        catch {
            return false
        }
    }

    func rewriteNowData(sectionInfo: Bool, contentData: Bool){
        if(sectionInfo){
            do{
                if let fileurl = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first{
                    //CSVファイルのパスを取得する。
                    let csvPath = fileurl.appendingPathComponent("/SectionInfo.csv")

                    //CSVファイルのデータを取得する。
                    var text = ""
                    for line in self.sectionInfo{
                        text += line + "\n"
                    }
                    try text.write(to: csvPath, atomically: true, encoding: String.Encoding.utf8)
                }
            }catch {

            }
        }
        if(contentData){
            do{
                if let fileurl = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first {
                    //CSVファイルのパスを取得する。
                    let csvPath = fileurl.appendingPathComponent("/ContentData.csv")

                    //CSVファイルのデータを取得する。
                    var text = ""
                    for section in self.contentData{
                        for line in section{
                            text += line + "\n"
                        }
                    }
                    try text.write(to: csvPath, atomically: true, encoding: String.Encoding.utf8)
                }
            }
            catch {

            }
        }
    }

    func sectionName() -> [String]{
        var sectionNames = [String]()
        for section in self.contents{
            sectionNames.append(section.title)
        }
        return sectionNames
    }

    func sectionTitleIndex (title: String) -> Int{
        var titleindex = -1
        for (index, item) in self.contents.enumerated(){
            if (item.title == title){
                titleindex = index
                return titleindex
            }
        }
        return titleindex
    }
}
