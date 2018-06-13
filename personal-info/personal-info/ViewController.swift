//
//  ViewController.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/10.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //initCsv() //uncomment when rewrite csv file
        var initdata = readCsv()
        if (initdata.0.count == 0) {
            initCsv()
            initdata = readCsv()
        }
        let appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

        appdelegate.commonvar.setdata(sections: initdata.0, contents: initdata.1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCsv(){
        do {
            if let fileurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/SectionInfo.csv")
                
                //CSVファイルのデータを取得する。
                let text = "Shopping,name,url,account,password\nAPP,name,password\n"
                try text.write(to: csvPath, atomically: true, encoding: String.Encoding.utf8)
            }
            if let fileurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
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
    
    func readCsv() -> ([String], [String]) {
        do {
            var sections = [String]()
            var contents = [String]()
            //CSVファイルのパスを取得する。
            if let fileurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/SectionInfo.csv")
                //CSVファイルのデータを取得する。
                let csvData = try String(contentsOf: csvPath, encoding:String.Encoding.utf8)
                
                //改行区切りでデータを分割して配列に格納する。

                csvData.enumerateLines{ (line, stop) -> () in
                    sections.append(line)
                }
            }
            else{
                return ([], [])
            }
            if let fileurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                //CSVファイルのパスを取得する。
                let csvPath = fileurl.appendingPathComponent("/ContentData.csv")
                //CSVファイルのデータを取得する。
                let csvData = try String(contentsOf: csvPath, encoding:String.Encoding.utf8)

                //改行区切りでデータを分割して配列に格納する。

                csvData.enumerateLines{ (line, stop) -> () in
                    contents.append(line)
                }
            }
            else{
                return ([], [])
            }
            return (sections, contents)
        }
        catch {
            return ([], [])
        }
    }
}

