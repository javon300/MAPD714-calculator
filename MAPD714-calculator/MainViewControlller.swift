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
    var equation: String!
    var var1: String!
    var var2: String!
    @IBOutlet weak var resultdisplay: UILabel!
    @IBOutlet weak var display: UILabel!
    //operations buttons/ yellow buttons
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
    @IBOutlet weak var point_button: UIButton!
    
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
    @IBAction func pointPressed(_ sender: UIButton) {
        appendEquation(value: ".")
    }
    //operations buttons action when pressed
    
    @IBAction func plusPressed(_ sender: UIButton) {
        appendEquation(value:  " + ")
    }
    @IBAction func minusPressed(_ sender: UIButton) {
        appendEquation(value:  " - ")
    }
    @IBAction func multiplyPressed(_ sender: UIButton) {
        appendEquation(value: " * ")
    }
    @IBAction func dividePressed(_ sender: UIButton) {
        appendEquation(value: " / ")
    }
    @IBAction func modulus(_ sender: UIButton) {
        appendEquation(value: " % ")
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
       signChange()
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
       clearAll()
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        Calculation()
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        deleteLast()
    }
    
    //LifeCycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding corners to buttons
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
    //calears all values from all containers
    func clearAll(){
        equation = ""
        display.text = ""
        resultdisplay.text = ""
    }
    
    //places values after theu are pressed
    func appendEquation(value: String){
        equation = equation + value
        display.text = equation
    }
    
    func deleteLast(){
        equation.removeLast()
        display.text?.removeLast()
    }
    //add remove the negation sign
    func signChange()
    {
        //temp local vars
        var signVal: String = "+"
        var hold:String  = equation

        //if sign is positive change to negative and insert in front of equation
        if (signVal == "+")
        {
            if (hold.first == "-")
            {
                return
            }
            signVal = "-"
            //have to set value before using else error
            hold = signVal + equation
            equation = hold
            display.text = hold
            print("hold val" + hold)
            print(String(equation))
            return
        }
        //if sign is negative, then remove from equation and from display
        else if (signVal == "-")
        {
            //if neg is already present remove from equation
            if (hold.first == "-")
            {
                //if first value in string is - then delete it from display if not do nothing
                hold.removeFirst()
                print("hold val" + hold)
                print(String(equation))
                signVal = "+"
                display.text = hold
                equation = hold
                return
            }
            else
            {
                return
            }
        }
    }
    func formatResult(result: Double) -> String{
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f",result)
        }
        else{
            return String(format: "%.2f",result)
        }
    }
    func Calculation()
    {
        let hold = equation.split(separator: " ")
        print(hold);print( String(hold.count) )
        
        //check if array count is odd, if even then not valid equation
        if (hold.count % 2 == 1)
        {
            //when given two operands and one operator
            if (hold.count == 3)
            {
                var1 = String(hold[0])
                var2 = String(hold[2])
                // choose operator
                if (hold[1] == "*")
                {
                    multiplication(num1: var1, num2: var2)
                }
                else if (hold[1] == "/")
                {
                    division(num1: var1, num2: var2)
                }
                else if (hold[1] == "+")
                {
                    addition(num1: var1, num2: var2)
                }
                else if (hold[1] == "-")
                {
                    subtraction(num1: var1, num2: var2)
                }
                else if (hold[1] == "%")
                {
                    modulus(num1: var1, num2: var2)
                }
                else
                {
                    print("invalid operator, please enter operator.")
                }
            }
            else if(hold.count == 3)
            {
                
            }
            
        }
        else
        {
            print("invalid equation")
            return
        }
        
        //check for multiplication
        
    }
    func addition(num1: String, num2: String)
    {
        var res: Double!
        var val1: Double!
        var val2: Double!
        
        val1 = Double(num1)
        val2 = Double(num2)
        res = val1 + val2
        print("res" + String(res))
        
    }
    func modulus(num1: String, num2: String)
    {
        var res: Int!
        var val1: Int!
        var val2: Int!
        
        val1 = Int(num1)
        val2 = Int(num2)
        res = val1 % val2
        print("res" + String(res))
        
    }
    func subtraction(num1: String, num2: String)
    {
        var res: Double!
        var val1: Double!
        var val2: Double!
        
        val1 = Double(num1)
        val2 = Double(num2)
        res = val1 - val2
        print("res" + String(res))
        
    }
    func multiplication(num1: String, num2: String)
    {
        var res: Double!
        var val1: Double!
        var val2: Double!
        
        val1 = Double(num1)
        val2 = Double(num2)
        res = val1 * val2
        print("res" + String(res))
        
    }
    func division(num1: String, num2: String)
    {
        var res: Double!
        var val1: Double!
        var val2: Double!
        
        val1 = Double(num1)
        val2 = Double(num2)
        res = val1 / val2
        print("res" + String(res))
        
    }
}

