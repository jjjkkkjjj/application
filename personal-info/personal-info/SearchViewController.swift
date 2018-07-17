//
//  RightViewController.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/10.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITextFieldDelegate{


    //var mySearchBar: UISearchBar!
    var myTextField: UITextField!
    var myLabel : UILabel!
    var myButton : UIButton!
    let ButtonWidth: CGFloat = 64

    override func viewDidLoad() {
        super.viewDidLoad()

        myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width: 300, height: 50)
        //myButton.setImage(UIImage(named: "icon/back.png"), for: .normal)
        myButton.setTitle("<", for: .normal)
        myButton.setTitleColor(UIColor.gray, for: .normal)
        myButton.titleLabel?.font =  UIFont.systemFont(ofSize: 36)
        let buttonwidth = CGFloat("<".widthOfString(usingFont: myButton.titleLabel!.font!) + 10)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        self.view.addConstraints([
                // 左から
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: .left,
                        relatedBy: .equal,
                        toItem: self.view,
                        attribute: .left,
                        multiplier: 1.0,
                        constant: (ButtonWidth - buttonwidth)/2
                ),
                
                // 上から
                NSLayoutConstraint(
                    //item: self.mySearchBar,
                    item: self.myButton,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self.view,
                    attribute: .top,
                    multiplier: 1.0,
                    constant: UIApplication.shared.statusBarFrame.height + (ButtonWidth - buttonwidth)/2
                ),
                // 横（固定）
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: .width,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .width,
                        multiplier: 1.0,
                        constant: buttonwidth
                ),

                // 縦（固定）
                NSLayoutConstraint(
                        item: self.myButton,
                        attribute: .height,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .height,
                        multiplier: 1.0,
                        constant: buttonwidth
                )]
        )

        //サーチバー作成
        myTextField = UITextField()
        myTextField.delegate = self
        myTextField.frame = CGRect(x:0, y:0, width: 300, height: 50)
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        myTextField.placeholder = "Search"
        myTextField.borderStyle = .roundedRect
        myTextField.clearButtonMode = .whileEditing
        myTextField.returnKeyType = .search
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myTextField)
        //mySearchBar = UISearchBar()
        //mySearchBar.delegate = self
        //mySearchBar.frame = CGRect(x:0, y:0, width: 300, height: 50)
        //mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        //mySearchBar.showsCancelButton = false
        //mySearchBar.placeholder = "Search"
        //mySearchBar.translatesAutoresizingMaskIntoConstraints = false
        //self.view.addSubview(mySearchBar)
        self.view.addConstraints([

                // self.veiwの上から10pxの位置に配置
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.myTextField,
                        attribute: NSLayoutAttribute.top,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.top,
                        multiplier: 1.0,
                        constant: UIApplication.shared.statusBarFrame.height
                ),

                // self.viewの横幅いっぱいにする
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.myTextField,
                        attribute: NSLayoutAttribute.width,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.width,
                        multiplier: 1.0,
                        constant: -ButtonWidth
                ),

                // 左から64px
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.myTextField,
                        attribute: .left,
                        relatedBy: .equal,
                        toItem: self.view,
                        attribute: .left,
                        multiplier: 1.0,
                        constant: ButtonWidth
                ),

                // self.viewのレイアウトに関わらず高さは64px
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.myTextField,
                        attribute: NSLayoutAttribute.height,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: nil,
                        attribute: NSLayoutAttribute.height,
                        multiplier: 1.0,
                        constant: ButtonWidth
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

    //完了を押すとkeyboardを閉じる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        //Keyboardを閉じる
        textField.resignFirstResponder()
        return true
    }

    //keyboard以外の画面を押すと、keyboardを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.myTextField.isFirstResponder) {
            self.myTextField.resignFirstResponder()
        }
    }


    //UITextFieldの編集前に処理を行う
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //textfield.text = "Hello World"
    }


    //UITextFieldの編集後に処理を行う
    func textFieldDidEndEditing(_ textField: UITextField) {
        //label.text = textfield.text
        //textfield.text = ""
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
        //mySearchBar.text = ""
        self.view.endEditing(true)
    }

    @IBAction func onBack(_ sender:UIButton){
        let mainview = storyboard!.instantiateViewController(withIdentifier: "Slide")
        self.present(mainview, animated: false, completion: nil)
    }
}
