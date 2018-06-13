//
//  RightViewController.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/10.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, UISearchBarDelegate{


    var mySearchBar: UISearchBar!
    var myLabel : UILabel!
    var myButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width: 300, height: 50)
        myButton.setImage(UIImage(named: "icon/back.png"), for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        self.view.addConstraints([

                // self.veiwの上から10pxの位置に配置
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: NSLayoutAttribute.top,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.top,
                        multiplier: 1.0,
                        constant: 10
                ),

                // 左から0px
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: .left,
                        relatedBy: .equal,
                        toItem: self.view,
                        attribute: .left,
                        multiplier: 1.0,
                        constant: 0
                ),

                // 横（固定）
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: .width,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .width,
                        multiplier: 1.0,
                        constant: 64
                ),

                // 縦（固定）
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: .height,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .height,
                        multiplier: 1.0,
                        constant: 64
                )]
        )

        //サーチバー作成
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRect(x:0, y:0, width: 300, height: 50)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        mySearchBar.showsCancelButton = false
        mySearchBar.placeholder = "Search"
        mySearchBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mySearchBar)
        self.view.addConstraints([

                // self.veiwの上から10pxの位置に配置
                NSLayoutConstraint(
                        item: self.mySearchBar,
                        attribute: NSLayoutAttribute.top,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.top,
                        multiplier: 1.0,
                        constant: 10
                ),

                // self.viewの横幅いっぱいにする
                NSLayoutConstraint(
                        item: self.mySearchBar,
                        attribute: NSLayoutAttribute.width,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.width,
                        multiplier: 1.0,
                        constant: 0
                ),

                // 左から64px
                NSLayoutConstraint(
                        item: self.mySearchBar,
                        attribute: .left,
                        relatedBy: .equal,
                        toItem: self.view,
                        attribute: .left,
                        multiplier: 1.0,
                        constant: 64
                ),

                // self.viewのレイアウトに関わらず高さは64px
                NSLayoutConstraint(
                        item: self.mySearchBar,
                        attribute: NSLayoutAttribute.height,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: nil,
                        attribute: NSLayoutAttribute.height,
                        multiplier: 1.0,
                        constant: 64
                )]
        )
        /*
        //ラベル（出力管理用）
        myLabel = UILabel(frame: CGRect(x:10,y:80,width: 300,height: 30))
        myLabel.layer.borderWidth = 1.0
        myLabel.layer.borderColor = UIColor.gray.cgColor
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myLabel)
        self.view.addConstraints([

                // 上から10px
                NSLayoutConstraint(
                        item: self.myLabel,
                        attribute: .top,
                        relatedBy: .equal,
                        toItem: self.mySearchBar,
                        attribute: .top,
                        multiplier: 1.0,
                        constant: 10
                ),

                // 左から10px
                NSLayoutConstraint(
                        item: self.myLabel,
                        attribute: .left,
                        relatedBy: .equal,
                        toItem: self.mySearchBar,
                        attribute: .left,
                        multiplier: 1.0,
                        constant: 10
                ),

                // 横（固定）
                NSLayoutConstraint(
                        item: self.myLabel,
                        attribute: .width,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .width,
                        multiplier: 1.0,
                        constant: 44
                ),

                // 縦（固定）
                NSLayoutConstraint(
                        item: self.myLabel,
                        attribute: .height,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .height,
                        multiplier: 1.0,
                        constant: 44
                )]
        )*/

    }

    //サーチバー更新時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //myLabel.text = searchText
    }
    /*
    //キャンセルクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        //myLabel.text = ""
        mySearchBar.text = ""
        let mainview = storyboard!.instantiateViewController(withIdentifier: "Main")
        self.present(mainview, animated: true, completion: nil)
    }*/

    //サーチボタンクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //myLabel.text = "社内に同じ意見があるか検索中..."
        mySearchBar.text = ""
        self.view.endEditing(true)
    }

    @IBAction func onBack(_ sender:UIButton){
        let mainview = storyboard!.instantiateViewController(withIdentifier: "Slide")
        self.present(mainview, animated: false, completion: nil)
    }
}
