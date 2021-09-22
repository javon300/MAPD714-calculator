//
//  ViewController.swift
//  MAPD714-calculator
//
//  Created by javon maxwell on 2021-09-21.
//

import UIKit

class MainViewControlller: UIViewController {
    
    //variable declarations
    @IBOutlet weak var display: UITextField!
    @IBOutlet weak var app_name_label: UILabel!
    @IBOutlet weak var point_button: UIButton!
    
   
    
    //LifeCycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding corners to buttons
        //buttons
        point_button.layer.cornerRadius = 15
        
    }

    @IBAction func point_button_pressed(_ sender: UIButton) {
          // self.display.text = "."
       }

}

