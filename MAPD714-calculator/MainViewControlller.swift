/*
 ViewController.swift
 MAPD714-calculator
 Author: Matthew Maxwell
 id: 301200258
 Created by matthew maxwell on 2021-09-21.
*/

import UIKit

class MainViewControlller: UIViewController {
    
    //variable declarations
    var equation: String = ""
    @IBOutlet weak var resultdisplay: UILabel!
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
    
    //number buttons action when pressed
    @IBAction func zeroPressed(_ sender: UIButton){
        appendEquation(value: "0")
    }
    @IBAction func onePressed(_ sender: UIButton) {
        appendEquation(value:  "1")
    }
    @IBAction func twoPressed(_ sender: UIButton) {
        appendEquation(value: "2")
    }
    @IBAction func threePressed(_ sender: UIButton) {
        appendEquation(value:  "3")
    }
    @IBAction func fourPressed(_ sender: UIButton) {
        appendEquation(value:  "4")
    }
    @IBAction func fivePressed(_ sender: UIButton) {
        appendEquation(value:  "5")
    }
    @IBAction func sixPressed(_ sender: UIButton) {
        appendEquation(value:  "6")
    }
    @IBAction func sevenPressed(_ sender: UIButton) {
        appendEquation(value:  "7")
    }
    @IBAction func eightPressed(_ sender: UIButton) {
        appendEquation(value:  "8")
    }
    @IBAction func ninePressed(_ sender: UIButton) {
        appendEquation(value: "9")
    }
    
    //operations buttons action when pressed
    
    @IBAction func plusPressed(_ sender: UIButton) {
        appendEquation(value:  "+")
    }
    @IBAction func minusPressed(_ sender: UIButton) {
        appendEquation(value:  "-")
    }
    @IBAction func multiplyPressed(_ sender: UIButton) {
        appendEquation(value: "*")
    }
    @IBAction func dividePressed(_ sender: UIButton) {
        appendEquation(value: "/")
    }
    @IBAction func modulus(_ sender: UIButton) {
        appendEquation(value: "%")
    }
    @IBAction func signPressed(_ sender: UIButton) {
        var sign = String("+")
        if (sign == "+"){
            sign = "-"
            return
        }
        sign = "+"
    }
    @IBAction func pointPressed(_ sender: UIButton) {
        appendEquation(value: ".")
    }
    @IBAction func clearPressed(_ sender: UIButton) {
       clearAll()
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        let expression = NSExpression(format: equation)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        resultdisplay.text = resultString
        
        
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        deleteLast()
    }
    
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
        clearAll()
    }
    
    func clearAll(){
        equation = ""
        display.text = ""
        resultdisplay.text = ""
    }
    func appendEquation(value: String){
        equation = equation + value
        display.text = equation
    }
    func deleteLast(){
        equation.removeLast()
        display.text?.removeLast()
    }
    func formatResult(result: Double) -> String{
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f",result)
        }
        else{
            return String(format: "%.2f",result)
        }
    }
}

