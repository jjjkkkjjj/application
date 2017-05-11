//
//  ViewController.swift
//  First
//
//  Created by Junnosuke Kado on 2017/05/03.
//  Copyright (c) 2017 JKadonosuke. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var segment_output: UILabel!
    @IBAction func next_button(sender: UIButton) {
    }

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    }




    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

    @IBAction func `switch`(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segment_output.text = "12345"
        case 1:
            segment_output.text = "******"
        case 2:
            segment_output.text = "www.unko"
        default:
            segment_output.text = "？"
        }
    }


}
