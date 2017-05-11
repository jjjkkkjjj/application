//
//  SearchViewController.swift
//  First
//
//  Created by Junnosuke Kado on 2017/05/04.
//  Copyright © 2017年 JKadonosuke. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController ,UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var SearchBar: UISearchBar!

    //データ
    
    
    var dataList =
            ["角淳之介",
             "山口周飛",
             "安岡大規",
            ]
    
    //検索結果配列
    var searchResult = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート先を自分に設定する。
        SearchBar.delegate = self
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        SearchBar.enablesReturnKeyAutomatically = false
        
        //検索結果配列にデータをコピーする。
        searchResult = dataList
        
        // Do any additional setup after loading the view.
    }

    //データを返すメソッド（スクロールなどでページを更新する必要が出るたびに呼び出される）
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Testcell", forIndexPath:indexPath) as UITableViewCell
        cell.textLabel?.text = searchResult[indexPath.row]

        return cell
    }


    //データの個数を返すメソッド
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return searchResult.count
    }


    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        SearchBar.endEditing(true)

        //検索結果配列を空にする。
        searchResult.removeAll()

        if(SearchBar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            searchResult = dataList
        } else {
            //検索文字列を含むデータを検索結果配列に追加する。
            for data in dataList {
                if data.containsString(SearchBar.text!) {
                    searchResult.append(data)
                }
            }
        }

        //テーブルを再読み込みする。
        TableView.reloadData()
    }

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
