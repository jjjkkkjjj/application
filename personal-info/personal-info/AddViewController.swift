//
//  AddViewController.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/11.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var SectionContainer: UIView!
    
    @IBOutlet weak var ContentContainer: UIView!

    var Segment: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup(){

        let buttons = ["セクションを追加", "データを追加"]
        Segment = UISegmentedControl(items: buttons as [AnyObject])
        Segment.addTarget(self, action: #selector(changeSegment), for: UIControlEvents.valueChanged)
        Segment.translatesAutoresizingMaskIntoConstraints = false


        self.view.addSubview(Segment)
        self.view.addConstraints([

                // self.veiwの上から10pxの位置に配置
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.Segment,
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
                        item: self.Segment,
                        attribute: NSLayoutAttribute.width,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.width,
                        multiplier: 1.0,
                        constant: 0
                )]
        )


        SectionContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(SectionContainer)
        self.view.addConstraints([

                // self.veiwの上から10pxの位置に配置
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.SectionContainer,
                        attribute: NSLayoutAttribute.top,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.top,
                        multiplier: 1.0,
                        constant: (UIApplication.shared.statusBarFrame.height + self.Segment.frame.size.height)
                ),

                // self.viewの横幅いっぱいにする
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.SectionContainer,
                        attribute: NSLayoutAttribute.width,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.width,
                        multiplier: 1.0,
                        constant: 0
                ),

                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.SectionContainer,
                        attribute: NSLayoutAttribute.height,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.height,
                        multiplier: 1.0,
                        constant: -(UIApplication.shared.statusBarFrame.height + self.Segment.frame.size.height)
                )]
        )

        ContentContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(ContentContainer)
        self.view.addConstraints([

                // self.veiwの上から10pxの位置に配置
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.ContentContainer,
                        attribute: NSLayoutAttribute.top,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.top,
                        multiplier: 1.0,
                        constant: (UIApplication.shared.statusBarFrame.height + self.Segment.frame.size.height)
                ),

                // self.viewの横幅いっぱいにする
                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.ContentContainer,
                        attribute: NSLayoutAttribute.width,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.width,
                        multiplier: 1.0,
                        constant: 0
                ),

                NSLayoutConstraint(
                        //item: self.mySearchBar,
                        item: self.ContentContainer,
                        attribute: NSLayoutAttribute.height,
                        relatedBy: NSLayoutRelation.equal,
                        toItem: self.view,
                        attribute: NSLayoutAttribute.height,
                        multiplier: 1.0,
                        constant: -(UIApplication.shared.statusBarFrame.height + self.Segment.frame.size.height)
                )]
        )
    }

    @IBAction func changeSegment(_ sender:UISegmentedControl){

        switch sender.selectedSegmentIndex{

        case 0:
            self.view.bringSubview(toFront: SectionContainer)
        case 1:
            self.view.bringSubview(toFront: ContentContainer)
        default:
            self.view.bringSubview(toFront: SectionContainer)
        }
    }



}
