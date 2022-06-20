//
//  ViewController.swift
//  Calculator-Exercise
//
//  Created by Le Ngoc Phu on 19/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var num1:Double?
    var num2:Double?
    var result:Double?
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
    @IBOutlet weak var btnPositiveAndNegative: UIButton!
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
        checkButton(button: sender)
    }
    
    
    func checkButton(button: UIButton){
        let btnTxt:String = button.titleLabel!.text!
        if Int(btnTxt) != nil && lblResult.text!.count < 25 {
            updateLabel(num: btnTxt)
        } else if btnTxt == "AC" {
            lblResult.text = "0"
        } else if btnTxt == "," {
            lblResult.text = lblResult.text! + ","
        } else {
            switch(btnTxt){
            case "+":
                clickFunctionButton(chooseNum: 1, btn: button)
                break
            case "-":
                clickFunctionButton(chooseNum: 2, btn: button)
                break
            case "x":
                clickFunctionButton(chooseNum: 3, btn: button)
                break
            case "÷":
                clickFunctionButton(chooseNum: 4, btn: button)
                break
            case "=":
                configAllButton()
                updateNum2()
                calculate()
                updateResult()
                break
            case "%":
                percentButton()
                break
            case "±":
                positiveAndNegative()
                break
            default:
                break
            }
        }
    }
    
    func configLayoutButton(button: UIButton){
        button.layer.cornerRadius = 3
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
        configLayoutButton(button: btnPositiveAndNegative)
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
        num1 = Double(changeCommaToDot(txt: lblResult.text!))
    }
    
    func updateNum2(){
        num2 = Double(changeCommaToDot(txt: lblResult.text!))
    }
    
    func calculate(){
        if num1 != nil && num2 != nil {
            switch(functionChoose){
            case 1:
                result = num1! + num2!
            case 2:
                result = num1! - num2!
                break
            case 3:
                result = num1! * num2!
                break
            case 4:
                result = num1! / num2!
                break
            default:
                break
            }
        }
    }
    
    func updateResult(){
        checkNumberAndUpdateLabel(num: result!)
    }
    
    func percentButton(){
        var textOnLabel = lblResult.text!
        textOnLabel = changeCommaToDot(txt: textOnLabel)
        var numOnLabel = Double(textOnLabel)
        numOnLabel! /= 100
        checkNumberAndUpdateLabel(num: numOnLabel!)
    }
    
    func positiveAndNegative(){
        var txtOnLabel = lblResult.text!
        txtOnLabel = changeCommaToDot(txt: txtOnLabel)
        var numOnLabel = Double(txtOnLabel)
        numOnLabel! *= -1
        checkNumberAndUpdateLabel(num: numOnLabel!)
    }
    
    func changeCommaToDot(txt: String) -> String{
        return txt.replacingOccurrences(of: ",", with: ".")
    }
    
    func changeDotToComma(txt: String) -> String{
        return txt.replacingOccurrences(of: ".", with: ",")
    }
    
    func replaceDot0(txt: String) -> String{
        return txt.replacingOccurrences(of: ".0", with: "")
    }
    
    func checkNumberAndUpdateLabel(num: Double) {
        var newString = String(num)
        if num >= 1 || num <= -1 {
            newString = replaceDot0(txt: newString)
        }
        newString = changeDotToComma(txt: newString)
        lblResult.text = newString
    }
}

