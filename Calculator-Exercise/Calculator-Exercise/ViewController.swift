//
//  ViewController.swift
//  Calculator-Exercise
//
//  Created by Le Ngoc Phu on 19/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    func updateLabel(num:String){
        if (lblResult.text == "0"){
            lblResult.text = num
        } else {
            let newString = lblResult.text! + num
            lblResult.text = newString
        }
    }
}

