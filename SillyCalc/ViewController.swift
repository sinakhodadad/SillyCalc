//
//  ViewController.swift
//  SillyCalc
//
//  Created by sinahk on 1/18/19.
//  Copyright © 2019 sinahk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBAction func numberPressed(_ sender: Any) {
        let digit = (sender as AnyObject).currentTitle!
        switch digit {
        case "1"?:
            display.text = "1"
        case "2"?:
            display.text = "2"
        case "3"?:
            display.text = "3"
        default:
            display.text = digit
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

