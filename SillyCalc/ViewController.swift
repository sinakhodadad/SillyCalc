//
//  ViewController.swift
//  SillyCalc
//
//  Created by sinahk on 1/18/19.
//  Copyright © 2019 sinahk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operandStack = Array<Double>()
    var userIsTyping = false
    
    var displayValue :Double{
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }set{
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    
    @IBAction func returnButtonPressed() {
        operandStack.append(displayValue)
        print("\(operandStack)")
        userIsTyping = false
    }
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numberPressed(_ sender: Any) {
        let digit = (sender as AnyObject).currentTitle!
        if userIsTyping {
            display.text = display.text! + digit!
        }else{
            display.text = digit!
            userIsTyping = true
        }
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        operandStack.removeAll()
        display.text = "0"
        userIsTyping = false
    }
    
    func doCalc(calc: (Double,Double) -> Double){
        if operandStack.count >= 2{
            displayValue = calc(operandStack.removeLast(), operandStack.removeLast())
            returnButtonPressed()
        }
    }
    
    @IBAction func calculationButton(_ sender: Any) {
        let buttonRecieved = (sender as AnyObject).currentTitle!
        if(userIsTyping){
            returnButtonPressed()
        }
        
        if operandStack.count >= 2 {
            switch buttonRecieved {
            case "×"?:
                doCalc(calc: {(op1, op2) in return op1 * op2})
            case "÷"?:
                doCalc(calc: {(op1, op2) in return op2 / op1})
            case "-"?:
                doCalc(calc: {(op1, op2) in return op2 - op1})
            case "+"?:
                doCalc(calc: {(op1, op2) in return op1 + op2})
            default:
                break
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

