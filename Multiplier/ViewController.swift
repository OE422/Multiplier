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
    var sqrt = UIButton()
    var sqr = UIButton()
    var divide = UIButton()
//    var operations = UISegmentedControl()
    var calculate = UIButton()
    var BowserJr = UIImageView()
    var resultLabel = UILabel()
    var stackView = UIStackView()
    var operationStack = UIStackView()
    var operation = ""
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
//        stackView.addArrangedSubview(operations)
        stackView.addArrangedSubview(operationStack)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(calculate)
        stackView.addArrangedSubview(resultLabel)
//        stackView.addArrangedSubview(BowserJr)
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        operationStack.axis = .horizontal
        operationStack.distribution = UIStackView.Distribution.equalSpacing
        operationStack.addArrangedSubview(add)
        operationStack.addArrangedSubview(subtract)
        operationStack.addArrangedSubview(multiply)
        operationStack.addArrangedSubview(divide)
        operationStack.addArrangedSubview(sqrt)
        operationStack.addArrangedSubview(sqr)
        
        BowserJr.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -270).isActive = true
        BowserJr.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        BowserJr.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        buttonSetup(arg: add, arg: "+")
        buttonSetup(arg: subtract, arg: "-")
        buttonSetup(arg: multiply, arg: "•")
        buttonSetup(arg: divide, arg: "÷")
        buttonSetup(arg: sqrt, arg: "√")
        buttonSetup(arg: sqr, arg: "^")
        buttonSetup(arg: calculate, arg: "Calculate")
        calculate.addTarget(self, action: #selector(self.calc), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        subtract.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        multiply.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        divide.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        sqrt.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        sqr.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        
//        buttonSetup(arg: add, arg: "+")
//        add.tag = 1
        
//        operations.insertSegment(withTitle: "+", at: 1, animated: true)
//        operations.insertSegment(withTitle: "-", at: 2, animated: true)
//        operations.insertSegment(withTitle: "•", at: 3, animated: true)
//        operations.insertSegment(withTitle: "÷", at: 4, animated: true)
//        operations.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20, weight: .bold)], for: .normal)
        
        
    }

    @objc func calc (sender: UIButton!)
    {
        doMath()
        add.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        subtract.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        multiply.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        divide.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        sqr.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        operation = ""
    }
    @objc func operate (sender: UIButton!)
    {
        if (sender == add)
        {
            operation = "+"
            add.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
            subtract.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            multiply.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            divide.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqr.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        }
        if (sender == subtract)
        {
            operation = "-"
            add.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            subtract.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
            multiply.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            divide.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqr.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        }
        if (sender == multiply)
        {
            operation = "•"
            add.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            subtract.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            multiply.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
            divide.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqr.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        }
        if (sender == divide)
        {
            operation = "÷"
            add.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            subtract.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            multiply.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            divide.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
            sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqr.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        }
        if (sender == sqrt)
        {
            operation = "√"
            sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
            add.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            subtract.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            multiply.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            divide.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqr.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        }
        if (sender == sqr)
        {
            operation = "^"
            sqrt.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            add.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            subtract.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            multiply.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            divide.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            sqr.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        }
    }
    func buttonSetup (arg button: UIButton, arg title: String)
    {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        calc(sender: calculate)
        
        return true
    }
    func doMath ()
    {
        
        if (operation == "")
        {
            resultLabel.text = "Choose an operation"
        }
        else if (operation == "√")
        {
            let result = (Double(textField1.text ?? "1.0" )!).squareRoot()
            let isInteger = floor(result)
            if  (isInteger == result)
            {
                resultLabel.text = "\(operation)\((textField1.text)!) \((textField2.text)!) = \(Int(result))"
                BowserJr.isHidden = true
                if (result == 64)
                {
                    BowserJr.isHidden = false
                }
            }
            else
            {
                resultLabel.text = "\(operation)\((textField1.text)!) \((textField2.text)!) = \(result)"
            }
        }
        else if (textField1.text == "" || textField2.text == "")
        {
            resultLabel.text = "Some of the required fields are filled with invalid entries."
        }
        
        else
        {
            let x = Double((textField1.text)!)
            let y = Double((textField2.text)!)
            var result = Double()
            if (operation == "+")
            {
                result = (x)! + (y)!
            }
            if (operation == "-")
            {
                result = (x)! - (y)!
            }
            if (operation == "•")
            {
                result = (x)! * (y)!
            }
            if (operation == "÷")
            {
                result = (x)! / (y)!
            }
            if (operation == "√")
            {
                result = (x)! / (y)!
            }
            if (operation == "^")
            {
                result = pow((x)!, (y)!)
            }
            let isInteger = floor(result)
            if  (isInteger == result)
            {
                resultLabel.text = "\((textField1.text)!) \(operation) \((textField2.text)!) = \(Int(result))"
                BowserJr.isHidden = true
                if (result == 64)
                {
                    BowserJr.isHidden = false
                }
            }
            else
            {
                resultLabel.text = "\((textField1.text)!) \(operation) \((textField2.text)!) = \(result)"
            }
            
        }
    }
}
