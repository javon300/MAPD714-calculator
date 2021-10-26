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
    //assignment part 3/ new buttons
    @IBOutlet weak var sin_button: UIButton!
    @IBOutlet weak var cos_button: UIButton!
    @IBOutlet weak var tan_button: UIButton!
    @IBOutlet weak var rand_button: UIButton!
    @IBOutlet weak var pie_button: UIButton!
    @IBOutlet weak var square_button: UIButton!
    @IBOutlet weak var root_button: UIButton!
    
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
    @IBAction func sinPressed(_ sender: UIButton) {
        appendEquation(value: " sin ")
    }
    @IBAction func cosPressed(_ sender: UIButton) {
        appendEquation(value: " cos ")
    }
    @IBAction func tanPressed(_ sender: UIButton) {
        appendEquation(value: " tan ")
    }
    @IBAction func squarePressed(_ sender: UIButton) {
        appendEquation(value: " ² ")
    }
    @IBAction func randPressed(_ sender: UIButton) {
        //replace sign with number for calculation but shows sign only to user
        display.text =  equation + " rand "
        let random = rand()
        equation = equation + random
    }
    @IBAction func rootPressed(_ sender: UIButton) {
        appendEquation(value: " √ ")
    }
    @IBAction func piePressed(_ sender: UIButton) {
        //replace sign with number for calculation but shows sign only to user
        display.text =  equation + " π "
        equation = equation +  " 3.14 "
       

    }
    
    @IBAction func signPressed(_ sender: UIButton) {
       //signChange()
        sign(val: equation)
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
    //part three new operands button action when pressed
    
    
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
        // part 3 new operands
        sin_button.layer.cornerRadius = 15
        cos_button.layer.cornerRadius = 15
        tan_button.layer.cornerRadius = 15
        square_button.layer.cornerRadius = 15
        pie_button.layer.cornerRadius = 15
        rand_button.layer.cornerRadius = 15
        rand_button.layer.cornerRadius = 15
        clearAll()
    }
    //clears all values from all containers
    func clearAll(){
        equation = ""
        display.text = ""
        resultdisplay.text = ""
    }
    
    //places values after theu are pressed
    func appendEquation(value: String)
    {
        equation = equation + value
        display.text = equation
    }
    
    //places values after theu are pressed
    func appendResult(value: String)
    {
        resultdisplay.text = value
    }
    
    func deleteLast()
    {
        equation.removeLast()
        display.text?.removeLast()
    }
    func sign(val: String){
        var signed: Double!
        var hold = val.split(separator: " ")
        print(hold);print( String(hold.count) )
        
        //check if equation has one or more operands and signs the last one
        if(hold.count == 1)
        {
            signed = Double(hold[0])
            signed = -signed//signs value
            equation = String(signed)
        }
        else if (hold.count == 3)
        {
            signed = Double(hold[2])
            signed = -signed
            
            //splitting removes space around operands so
            //eradded space with these next line
            hold[1] = " " + hold[1] + " "
           
            
            equation = hold[0] + hold[1] + String(signed)
        }
        else if (hold.count != 3 || hold.count != 1)
        {
           print("invalid operation")
        }
        display.text = equation
    }
    
   
    func formatResult(result: Double) -> String{
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f",result)
        }
        else{
            return String(format: "%.8f",result)
        }
    }
    func Calculation()
    {
        let hold = equation.split(separator: " ")
        print("num of vars" + String(hold.count) )
        print(hold)
    
        if(hold.count == 2)
        {
            var1 = String(hold[0])
            var2 = String(hold[1])
            // choose operator
            if (hold[0] == "sin")
            {
                trig(operand: var1, num: var2)
            }
            else if (hold[0] == "cos")
            {
                trig(operand: var1, num: var2)
            }else if (hold[0] == "tan")
            {
                trig(operand: var1, num: var2)
            }
//
            else if (hold[0] == "√")
            {
                root(operand: var1, num: var2)
            }
            else if (hold[1] == "²")
            {
                square(num: var1, operand: var2)
            }
            else
            {
                print("not a two digit operation, reevqluate your equation")
            }
            
        }
        //check if array count is odd, if even then not valid equation
        else if (hold.count % 2 == 1)
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
            }//basic operands
        }// mod check on variables
        else
        {
            print("invalid equation")
            return
        }
        
    }//calculation close

    func addition(num1: String, num2: String)
    {
        var res: Double!
        var val1: Double!
        var val2: Double!
        
        val1 = Double(num1)
        val2 = Double(num2)
        res = val1 + val2
        print("res" + String(res))
        appendResult(value: formatResult(result: res))
        
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
        resultdisplay.text = String(res)
        
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
        appendResult(value: formatResult(result: res))
        
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
        appendResult(value: formatResult(result: res))
        
    }
    
    func square(num: String, operand: String )
    {
        var res: Double!
        var val: Double!
        val = Double(num)
        res = val * val
        print("result" + String(res))
        appendResult(value: formatResult(result: res))
        
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
        appendResult(value: formatResult(result: res))
        
    }
    
    func trig(operand: String, num: String)
    {
        var res: Double!
        var val1: Double!
        

        val1 = Double(num)
        
        if (operand == "sin")
        {
            res = sin(val1)
        }
        else if (operand == "cos")
        {
            res = cos(val1)
        }
        else if (operand == "tan")
        {
            res = tan(val1)
        }
        else
        {
            res = 0.00
        }
        print("res" + String(res))
        appendResult(value: formatResult(result: res))

    }
    func root(operand: String, num: String)
    {
        var res: Double!
        var val1: Double!
        val1 = Double(num)
        
        res = val1.squareRoot()
        print("res" + String(res))
        appendResult(value: formatResult(result: res))
    }
    func pie(num1: String, num2: String)
    {
        var res: Double!
        
        res = 3.14
        print("res" + String(res))
        appendResult(value: formatResult(result: res))
        
    }
    
    func rand() -> String
    {
        var res: Double!
        
        res = Double.random(in: 0...100)        //random generator
        print("res" + String(res))
        appendResult(value: formatResult(result: res))
        return String(res)
    }
    
}

