//
//  ViewController.swift
//  MAPD714-calculator
//
//  Created by javon maxwell on 2021-09-21.
//

import UIKit

class MainViewControlller: UIViewController {
    
    //variable declarations
    
    @IBOutlet weak var display: UILabel!
    //operations buttons/ yellow buttons
    @IBOutlet weak var point_button: UIButton!
 
    @IBOutlet weak var divide_button: UIButton!
    
    @IBOutlet weak var multiply_button: UIButton!
    
    
    @IBOutlet weak var subtract_button: UIButton!
    @IBOutlet weak var plus_button: UIButton!
    @IBOutlet weak var percent_button: UIButton!
    @IBOutlet weak var sign_button: UIButton!
    @IBOutlet weak var clear_button: UIButton!
    @IBOutlet weak var equal_button: UIButton!
    @IBOutlet weak var back_space_button: UIButton!
    //number buttons/ green buttons
    @IBOutlet weak var one_button: UIButton!
    @IBOutlet weak var two_button: UIButton!
    @IBOutlet weak var three_button: UIButton!
    @IBOutlet weak var four_button: UIButton!
    @IBOutlet weak var five_button: UIButton!
    @IBOutlet weak var six_button: UIButton!
    @IBOutlet weak var seven_button: UIButton!
    @IBOutlet weak var eight_button: UIButton!
    @IBOutlet weak var nine_button: UIButton!
    @IBOutlet weak var zero_button: UIButton!
    
    
    //LifeCycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding corners to buttons
        //operations buttons
        point_button.layer.cornerRadius = 15
        divide_button.layer.cornerRadius = 15
        multiply_button.layer.cornerRadius = 15
        subtract_button.layer.cornerRadius = 15
        plus_button.layer.cornerRadius = 15
        percent_button.layer.cornerRadius = 15
        sign_button.layer.cornerRadius = 15
        clear_button.layer.cornerRadius = 15
        equal_button.layer.cornerRadius = 15
        back_space_button.layer.cornerRadius = 15
        //number buttons
        one_button.layer.cornerRadius = 15
        two_button.layer.cornerRadius = 15
        three_button.layer.cornerRadius = 15
        four_button.layer.cornerRadius = 15
        five_button.layer.cornerRadius = 15
        six_button.layer.cornerRadius = 15
        seven_button.layer.cornerRadius = 15
        eight_button.layer.cornerRadius = 15
        nine_button.layer.cornerRadius = 15
        zero_button.layer.cornerRadius = 15
    }
}

