//
//  ViewController.swift
//  Multiplier
//
//  Created by  on 9/23/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField1 = UITextField()
    var textField2 = UITextField()
    var add = UIButton()
    var subtract = UIButton()
    var multiply = UIButton()
    var divide = UIButton()
    var BowserJr = UIImageView()
    var productLabel = UILabel()
    var stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        view.backgroundColor = UIColor.lightGray
        textFieldSetup(arg: textField1)
        textFieldSetup(arg: textField2)
        
        BowserJr.image = UIImage(named: "BowserJr")
//        BowserJr.frame = CGRect(x: BowserJr.frame.origin.x, y: BowserJr.frame.origin.y, width: 100, height: 142)
         BowserJr.frame = CGRect.zero
        BowserJr.isHidden = true
        BowserJr.contentMode = UIView.ContentMode.scaleAspectFit
        self.view.addSubview(BowserJr)
        BowserJr.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(productLabel)
//        stackView.addArrangedSubview(BowserJr)
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        BowserJr.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -270).isActive = true
        BowserJr.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        BowserJr.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func textFieldSetup (arg txtFld: UITextField)
    {
        txtFld.delegate = self
        txtFld.placeholder = "Enter a number"
        txtFld.font = UIFont.systemFont(ofSize: 15)
        txtFld.borderStyle = UITextField.BorderStyle.roundedRect
        txtFld.autocorrectionType = UITextAutocorrectionType.yes
        txtFld.keyboardType = UIKeyboardType.decimalPad
        txtFld.returnKeyType = UIReturnKeyType.done
        txtFld.clearButtonMode = UITextField.ViewMode.whileEditing;
        txtFld.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(txtFld)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        
        
        if(checkIfInt(arg: (Double(textField1.text ?? "1.0")!) * (Double(textField2.text ?? "1.0")!)))
        {
            productLabel.text = String(Int((Double(textField1.text ?? "1.0")!)*(Double(textField2.text ?? "1.0")!)))
            if (Int((Double(textField1.text ?? "1.0")!)*(Double(textField2.text ?? "1.0")!)) == 64)
            {
                BowserJr.isHidden = false
            }
        }
        else
        {
            productLabel.text = String((Double(textField1.text ?? "1.0")!)*(Double(textField2.text ?? "1.0")!))
        }
        return true
    }
    func checkIfInt (arg x: Double) -> Bool
    {
        let isInteger = floor(x)
        if  (isInteger == x)
        {
            return true
        }
        return false
    }


}
