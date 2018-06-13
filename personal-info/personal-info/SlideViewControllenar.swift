//
//  SlideViewController.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/10.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class SlideViewController: SlideMenuController{
    
    override func awakeFromNib(){
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "Main")
        
        let leftVC = storyboard?.instantiateViewController(withIdentifier: "Left")

        //let rightVC = storyboard?.instantiateViewController(withIdentifier: "Right")

        let navigationController = UINavigationController(rootViewController: mainVC!)

        mainViewController = navigationController
        leftViewController = leftVC
        //rightViewController = rightVC
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
