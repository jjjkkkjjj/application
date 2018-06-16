//
//  SliderViewController2.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/10.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var myTableView: UITableView!

    var File: File = (UIApplication.shared.delegate as! AppDelegate).commonvar.file
    var FoldingFlags = [Bool]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        dock()
        tableview()
        // Do any additional setup after loading the view.
    }

    private func tableview(){
        // デリゲートを設定する。
        myTableView.delegate = self
        myTableView.dataSource = self
        //myTableView.estimatedRowHeight = 50
        //myTableView.rowHeight = UITableViewAutomaticDimension
        for _ in self.File.contents{
            self.FoldingFlags.append(false)
        }
    }

    // UIViewを返す。
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // セクションのヘッダとなるビューを作成する。
        let myView: UIView = UIView()
        let label:UILabel = UILabel()
        label.text = self.File.contents[section].title
        label.sizeToFit()
        label.textColor = UIColor.black
        myView.addSubview(label)
        myView.backgroundColor = UIColor.green

        // セクションのビューに対応する番号を設定する。
        myView.tag = section
        // セクションのビューにタップジェスチャーを設定する。
        myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(gestureRecognizer:))))

        return myView
    }

    // セクションの数を返す。
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.File.contents.count
    }

    // セクションのタイトルを返す。
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.File.contents[section].title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FoldingFlags[section] ? 0: self.File.contents[section].itemCount()
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier:  "cell", for:indexPath as IndexPath)
        //cell.textLabel?.text = self.File.contents[indexPath.section].contenttitles[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! DataCell
        let item = self.File.contents[indexPath.section]
        cell.configureCell(item: item, row: indexPath.row)

        return cell
    }

    // テーブルビューをスワイプしてデータを削除する。
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            self.File.removeData(section: indexPath.section, sectionRow: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
            //print("called del")
            // this area is processed when tapped delete button
            // rewrite csv

        }
        deleteButton.backgroundColor = UIColor.red

        return [deleteButton]
    }

    // 選択したセルの値を出力する。
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // タップしたセルのテキストを取得する。
        let selectText = self.File.contents[indexPath.section].itemtitles[indexPath.row]

        // アラートを生成する。
        let alert: UIAlertController = UIAlertController(title: selectText, message: "\(selectText)を選択しました。", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
        alert.addAction(defaultAction)

        // アラートを表示する。
        present(alert, animated: true, completion: nil)
    }

    //
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat{
        return self.File.contents[indexPath.section].cellHeight()
    }


    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        // タップされたセクションを取得する。
        guard let section = gestureRecognizer.view?.tag as Int! else {
            return
        }

        // フラグを設定する。
        self.FoldingFlags[section] = !self.FoldingFlags[section]

        // タップされたセクションを再読込する。
        myTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }

    private func dock(){
        //NavigationBarが半透明かどうか
        navigationController?.navigationBar.isTranslucent = false
        //NavigationBarの色を変更します
        navigationController?.navigationBar.barTintColor = UIColor(red: 129/255, green: 212/255, blue: 78/255, alpha: 1)
        //NavigationBarに乗っている部品の色を変更します
        navigationController?.navigationBar.tintColor = UIColor.white
        //バーの左側にボタンを配置します(ライブラリ特有)
        addLeftBarButtonWithImage(UIImage(named: "icon/menu.png")!)

        let rightSearchButtonItem:UIBarButtonItem =
                UIBarButtonItem(image: UIImage(named: "icon/search.png"),
                        style: UIBarButtonItemStyle.plain, target: self, action: #selector(onClickSearch))

        let rightAddBarButtonItem:UIBarButtonItem =
                UIBarButtonItem(image: UIImage(named: "icon/add.png"),
                        style: UIBarButtonItemStyle.plain, target: self, action: #selector(onClickAdd))

        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem, rightSearchButtonItem], animated: true)
        //addRightBarButtonWithImage(UIImage(named: "icon/search.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickSearch(_ sender:UIButton){
        let searchview = storyboard!.instantiateViewController(withIdentifier: "Search")
        self.present(searchview, animated: false, completion: nil)
    }

    @IBAction func onClickAdd(_ sender:UIButton){
        let addview = storyboard!.instantiateViewController(withIdentifier: "Add")
        self.present(addview, animated: false, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
