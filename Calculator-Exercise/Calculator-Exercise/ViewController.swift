//
//  ViewController.swift
//  Calculator-Exercise
//
//  Created by Le Ngoc Phu on 19/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var num1:Int?
    var num2:Int?
    var result:Int?
    var resultDiv:Double?
    var functionChoose:Int = 0
    var updateLabelNum2:Bool = false
    
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btnComma: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnPlusOrMinus: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    @IBOutlet weak var btnDiv: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAllButton()
    }
    

    @IBAction func btnPressed(_ sender: UIButton) {
        let btnTxt:String = sender.titleLabel!.text!
        if Int(btnTxt) != nil && lblResult.text!.count < 25 {
            updateLabel(num: btnTxt)
        } else if btnTxt == "AC" {
            lblResult.text = "0"
        } else {
            switch(btnTxt){
            case "+":
                clickFunctionButton(chooseNum: 1, btn: sender)
                break
            case "-":
                clickFunctionButton(chooseNum: 2, btn: sender)
                break
            case "x":
                clickFunctionButton(chooseNum: 3, btn: sender)
                break
            case "÷":
                clickFunctionButton(chooseNum: 4, btn: sender)
                break
            case "=":
                configAllButton()
                updateNum2()
                calculate()
                break
            case "%":
                break
            case "±":
                break
            default:
                break
            }
        }
        
    }
    
    
    func configLayoutButton(button: UIButton){
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    func configAllButton(){
        configLayoutButton(button: btn0)
        configLayoutButton(button: btn1)
        configLayoutButton(button: btn2)
        configLayoutButton(button: btn3)
        configLayoutButton(button: btn4)
        configLayoutButton(button: btn5)
        configLayoutButton(button: btn6)
        configLayoutButton(button: btn7)
        configLayoutButton(button: btn8)
        configLayoutButton(button: btn9)
        configLayoutButton(button: btnComma)
        configLayoutButton(button: btnPlus)
        configLayoutButton(button: btnPlus)
        configLayoutButton(button: btnMinus)
        configLayoutButton(button: btnMul)
        configLayoutButton(button: btnDiv)
        configLayoutButton(button: btnAC)
        configLayoutButton(button: btnPlusOrMinus)
        configLayoutButton(button: btnPercent)
        configLayoutButton(button: btnEqual)
    }
    
    func changeBoderColor(button: UIButton){
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    func updateLabel(num:String){
        let txt:String = lblResult.text!
        if txt == "0" || updateLabelNum2 == true{
            lblResult.text = num
            updateLabelNum2 = false
        } else {
            let newString = lblResult.text! + num
            lblResult.text = newString
        }
    }
    
    func clickFunctionButton(chooseNum: Int, btn: UIButton){
        configAllButton()
        updateNum1()
        functionChoose = chooseNum
        changeBoderColor(button: btn)
        updateLabelNum2 = true
    }
    
    func updateNum1(){
        num1 = Int(lblResult.text!)
    }
    
    func updateNum2(){
        num2 = Int(lblResult.text!)
    }
    
    func calculate(){
        if num1 != nil && num2 != nil {
            switch(functionChoose){
            case 1:
                result = num1! + num2!
                lblResult.text = String(result!)
                break
            case 2:
                result = num1! - num2!
                lblResult.text = String(result!)
                break
            case 3:
                result = num1! * num2!
                lblResult.text = String(result!)
                break
            case 4:
                resultDiv = Double(num1!) / Double(num2!)
                lblResult.text = String(resultDiv!)
                break
            default:
                break
            }
        }
    }
    
}

